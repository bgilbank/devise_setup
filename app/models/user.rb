class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, password_length: 10..50

  validate :password_complexity

  def password_complexity
    if password.present? and not password.match(/\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/)
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
    end
  end

    validates :first_name, presence: true,
	length: { minimum: 2, maximum: 25 }

	validates :last_name, presence: true,
	length: { minimum: 2, maximum: 25 }

  mount_uploader :img, UserUploader

  extend FriendlyId
  friendly_id :uniqueslug, use: :slugged 
  
  def uniqueslug 
    "#{first_name}-#{last_name}" 
  end 

end
