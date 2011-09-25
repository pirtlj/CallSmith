class Call < ActiveRecord::Base
  belongs_to :contact
  
  class << self
    def today
      where(:scheduled_for => Date.today)
    end
  end
  
end
