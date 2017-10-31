class CreatePhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :phone_numbers do |t|
      t.integer :contactable_id
      t.string :contactable_type
      t.string :number
      t.string :phone_type
      t.boolean :primary

      t.timestamps
    end
  end
end
