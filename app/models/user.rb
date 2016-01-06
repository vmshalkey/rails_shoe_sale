class User < ActiveRecord::Base
	has_many :shoes
	has_many :purchases, dependent: :destroy

  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, presence: true
	validates :email, presence: true, uniqueness: {case_sensitive: false}, format: { with: EMAIL_REGEX }

	before_save do
		self.first_name.capitalize!
		self.last_name.capitalize!
		self.email.downcase!
	end
end
