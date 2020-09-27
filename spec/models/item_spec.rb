require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品新規登録' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '新規登録がうまくいくとき' do
      it 'name,text,price,genre_id,condition_id,ship_fee_id,ship_from_id,ship_day_id,imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end

      it 'priceが¥300~¥9,999,999の間の場合は登録できる' do
        @item.price = 500
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'textが空では登録できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'genre_idが空では登録できない' do
        @item.genre_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Genre Select')
      end

      it 'condition_idが空では登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end

      it 'ship_fee_idが空では登録できない' do
        @item.ship_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship fee Select')
      end

      it 'ship_from_idが空では登録できない' do
        @item.ship_from_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship from Select')
      end

      it 'ship_day_idが空では登録できない' do
        @item.ship_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship day Select')
      end

      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが¥300未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'priceが¥10,000,000以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'priceに半角数字以外が含まれている場合は登録できない' do
        @item.price = 1, 0o00
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
    end
  end
end
