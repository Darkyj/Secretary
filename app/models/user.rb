class User < ActiveRecord::Base
	has_many :scheduled_events

	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates :first_name, :last_name, presence: true, length: { in: 2..20 }
	validates :email_address, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :phone_number, presence: true, uniqueness: true, numericality: { only_integer: true }
	before_save do
		self.email_address.downcase!
	end

	has_secure_password

end
