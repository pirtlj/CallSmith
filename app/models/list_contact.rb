class ListContact < ActiveRecord::Base
  include AASM
  
  belongs_to :list
  belongs_to :contact
  
  aasm_initial_state :pending
  aasm_state :pending
  aasm_state :completed

  aasm_event :complete do
    transitions :to => :completed, :from => [:pending]
  end
end
