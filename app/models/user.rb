class User < ActiveRecord::Base
	has_many :scheduled_reminders

	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates :first_name, :last_name, presence: true, length: { in: 2..20 }
	validates :email_address, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :phone_number, presence: true, uniqueness: true, numericality: { only_integer: true }
	validates :password, presence: true, length: { minimum: 6 }, on: :create



	before_save do
		self.email_address.downcase!
	end

	has_secure_password

end
