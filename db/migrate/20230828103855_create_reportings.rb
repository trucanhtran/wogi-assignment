class CreateReportings < ActiveRecord::Migration[7.0]
  def change
    create_table :reportings do |t|
      t.references :user, foreign_key: true
      t.references :card, foreign_key: true
      t.string :activity

      t.timestamps
    end
  end
end
