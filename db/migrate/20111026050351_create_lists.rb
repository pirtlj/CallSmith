class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.string :name
      t.string :sid
      t.date :scheduled_for

      t.timestamps
    end
  end
end
