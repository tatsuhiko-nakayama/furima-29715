class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name          , null: false
      t.text :text            , null: false
      t.integer :price        , null: false
      t.integer :genre_id     , null: false
      t.integer :condition_id , null: false
      t.integer :ship_fee_id  , null: false
      t.integer :ship_from_id , null: false
      t.integer :ship_day_id  , null: false
      t.references :user      , foreign_key: true
      t.timestamps
    end
  end
end
