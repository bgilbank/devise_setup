class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
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


end
