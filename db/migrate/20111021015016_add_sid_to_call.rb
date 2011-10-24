class AddSidToCall < ActiveRecord::Migration
  def change
      add_column :calls, :sid, :string
  end
end
