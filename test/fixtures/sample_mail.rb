class SampleMail < MailForm::Base
	attributes :name, :email, :nickname
	validates :nickname, absence: true

	def headers
		{ to: "recipient@example.com", from: self.email }
	end

	before_deliver do 
		evaluated_callbacks << :before
	end
	
	after_deliver do 
		evaluated_callbacks << :after
	end

	def evaluated_callbacks 
		@evaluated_callbacks ||= []
	end
end