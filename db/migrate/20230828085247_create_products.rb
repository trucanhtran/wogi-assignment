class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :category
      t.integer :stock_quantity
      t.decimal :price, precision: 10, scale: 2
      t.decimal :discount_percentage, precision: 5, scale: 2
      t.float :rating
      t.boolean :availability
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end