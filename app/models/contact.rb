class Contact < ActiveRecord::Base
  has_many :calls
  
  accepts_nested_attributes_for :calls
  
  class << self
    public  
      def phone_regex
        "/[01]?[- .]?\\(?[2-9]\\d{2}\\)?[- .]?\\d{3}[- .]?\\d{4}/"
      end  
  end
  
end
