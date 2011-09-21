class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.integer :contact_id
      t.date :scheduled_for

      t.timestamps
    end
  end
end
