# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :number, null: false
      t.string :neighborhood
      t.string :city, null: false
      t.string :state, null: false
      t.string :zipcode

      t.timestamps
    end
  end
end
