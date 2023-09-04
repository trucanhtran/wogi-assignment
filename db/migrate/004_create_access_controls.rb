class CreateAccessControls < ActiveRecord::Migration[7.0]
  def change
    create_table :access_controls do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
