class List < ActiveRecord::Base
  belongs_to :user
  has_many :list_contacts
  has_many :contacts, :through => :list_contacts
end
