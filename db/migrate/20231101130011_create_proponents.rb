class CreateProponents < ActiveRecord::Migration[5.0]
  def change
    create_table :proponents do |t|
      t.string :name, null: false
      t.string :document, null: false
      t.date :birthday
      t.references :address, null: false, foreign_key: true
      t.string :personal_phone
      t.string :references_phone
      t.decimal :salary, null: false, precision: 10, scale: 2
      t.decimal :inss_discount, null: false, precision: 10, scale: 2

      t.timestamps
    end
  end
end
