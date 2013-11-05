class ScheduledReminder < ActiveRecord::Base
  belongs_to :user
  
	validates :title, :description, presence: true, length: { in: 2..100 }

	def self.deliver(id)
  		find(id).deliver
 	end

  def deliver
    
    # twilio_sid = "" Sid goes here
    # twilio_token = "" Token goes here
    # twilio_phone_number = "" Twilio phone number goes here

    # TODO: make this dynamic
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      # :to => "+", Number to send the text number to goes here
      :body => "This is a message. You have to do things"
     )
  end

end
