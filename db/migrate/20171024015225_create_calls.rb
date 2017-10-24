class CreateCalls < ActiveRecord::Migration[5.1]
  def change
    create_table :calls do |t|
      t.integer :user_id
      t.text :params
      t.text :env

      t.timestamps
    end
  end
end
