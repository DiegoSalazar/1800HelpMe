class CreateCalls < ActiveRecord::Migration[5.1]
  def change
    enable_extension "hstore"
    create_table :calls do |t|
      t.integer :user_id
      t.integer :parent_id
      t.string :from
      t.string :to
      t.string :status
      t.text :recording_url
      t.text :recognized_speech
      t.hstore :meta

      t.timestamps
    end
  end
end
