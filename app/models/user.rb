class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_m, :phone_number
  
  before_save :ensure_authentication_token
  
  has_many :contacts
  has_many :calls, :through => :contacts
  
  
  def start_todays_calls
  end
  
  
end
