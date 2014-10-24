class Rolodex
	attr_reader :contacts
	def initialize
		@contacts = []
		@index = 1000

	end

	def add_contact(contact)
		contact.id = @@index
		@@index += 1
		@contacts << contact
end
