class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.text :description
      t.string :website
      t.integer :established_year
      t.string :location
      t.boolean :availability
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
