class ListContact < ActiveRecord::Base
  belongs_to :list
  belongs_to :contact
end
