class Contact < ActiveRecord::Base
  belongs_to :user
  
  has_many :calls, :dependent => :destroy
  has_many :contact_notes, :dependent => :destroy
  has_many :list_contacts, :dependent => :destroy

  has_many :lists, :through => :list_contacts
    
  accepts_nested_attributes_for :calls
  
  class << self
    public  
      def phone_regex
        "/[01]?[- .]?\\(?[2-9]\\d{2}\\)?[- .]?\\d{3}[- .]?\\d{4}/"
      end  
  end
  
end
