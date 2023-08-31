class AddProductIdAndValueToReportings < ActiveRecord::Migration[7.0]
  def change
    add_reference :reportings, :product, null: false, foreign_key: true
    add_column :reportings, :value, :decimal, precision: 10, scale: 2
  end
end
