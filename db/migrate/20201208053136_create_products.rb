class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title,                   null: false
      t.text :text,                      null: false
      t.integer :category_id,            null: false
      t.integer :sales_status_id,        null: false
      t.integer :deliveryfee_id,         null: false
      t.integer :deliveryarea_id,        null: false
      t.integer :deliveryday_id,         null: false
      t.integer :price,                  null: false                
      t.references :user,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
