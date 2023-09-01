class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.references :product, null: true, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.decimal :value, precision: 10, scale: 2, null: false
      t.string :code, null: false, unique: true
      t.string :purchase_details_pin
      t.boolean :cancelled, default: false
      t.datetime :cancelled_at

      t.timestamps
    end
  end
end
