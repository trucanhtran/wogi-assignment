class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :card_number
      t.string :unique_activation_number
      t.string :purchase_details_pin
      t.boolean :cancelled
      t.datetime :cancelled_at

      t.timestamps
    end
  end
end
