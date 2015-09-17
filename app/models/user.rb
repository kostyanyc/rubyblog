class User < ActiveRecord::Base
  before_create :generate_authentication_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true,
                           uniqueness: true,
                           format: {
                           	with: /\A[a-zA-Z0-9]+\z/,
                           	message: "Must be formatted correctly"
                           }

  has_many :statuses


  def full_name
  	first_name + " " + last_name
  end

  def generate_authentication_token
    loop do
      self.auth_token = SecureRandom.base64(64)
      break unless User.find_by(auth_token: auth_token)
    end
  end
end
