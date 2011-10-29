class CreateListContacts < ActiveRecord::Migration
  def change
    create_table :list_contacts do |t|
      t.integer :list_id
      t.integer :contact_id

      t.timestamps
    end
  end
end
