class CreateApplication < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :description
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
