class AddAasmToListContacts < ActiveRecord::Migration
  def change
    add_column :list_contacts, :aasm_state, :string
  end
end

