class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_m, :phone_number
  
  phone_regex = "/[01]?[- .]?\\(?[2-9]\\d{2}\\)?[- .]?\\d{3}[- .]?\\d{4}/"
  
  before_save :ensure_authentication_token
  
  has_many :contacts, :dependent => :destroy
  has_many :lists, :dependent => :destroy
  has_many :calls, :through => :contacts
  validates :phone_number, :presence => true
    def start_todays_calls
  end
  
  
end
