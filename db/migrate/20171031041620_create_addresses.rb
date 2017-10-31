class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :contactable_id
      t.string :contactable_type
      t.string :address_type
      t.boolean :primary
      t.text :street1
      t.text :street2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country

      t.timestamps
    end
  end
end
