class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def has_role(role)
    self.roles.find_by_name(role)
  end

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,
                  :password,
                  :password_confirmation,
                  :remember_me,
                  :first_name, 
                  :last_name,
                  :investor_id,
                  :user_type,
                  :notes

  belongs_to :investor

  has_many :participants
  has_many :events, :through => :participants

  has_many :folders
  has_many :tasks
  has_many :assignments
  has_many :roles, :through => :assignments

  accepts_nested_attributes_for :participants

end
