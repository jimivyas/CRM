class Contact
	attr_accessor :id, :first_name, :last_name, :email, :note
	def initialize
		@first_name = first_name
		@last_name = last_name
		@email = email
		@note = note
	end

	def add_contact(contact)
		contact.id = @@index
		@@index +=1
		@contacts << contact
	end

end
