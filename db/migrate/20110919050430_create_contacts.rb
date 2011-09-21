class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :phone_number
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :source

      t.timestamps
    end
  end
end
