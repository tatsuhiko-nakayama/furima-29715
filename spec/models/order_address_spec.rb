require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '商品購入がうまくいくとき' do
      it '必要な情報がすべて存在すれば購入できる' do
        expect(@order_address).to be_valid
      end

      it 'building_nameがなくても購入できる' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'tokenが不正値では購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では購入できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフン(-)が含まれていない場合は購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code Input correctly')
      end

      it 'prefecture_idが空では購入できない' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture Select')
      end

      it 'prefecture_idが「1」では購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture Select')
      end

      it 'cityが空では購入できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では購入できない' do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberにハイフン(-)が含まれている場合は購入できない' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Input correctly')
      end
    end
  end
end
