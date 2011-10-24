class AddAasmToCalls < ActiveRecord::Migration
  def change
    add_column :calls, :aasm_state, :string
  end
end
