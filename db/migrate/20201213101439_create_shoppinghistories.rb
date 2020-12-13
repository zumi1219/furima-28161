class CreateShoppinghistories < ActiveRecord::Migration[6.0]
  def change
    create_table :shoppinghistories do |t|
      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
    end
  end
end
