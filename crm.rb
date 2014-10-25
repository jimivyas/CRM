class CRM
require_relative './contact.rb'
require_relative './rolodex.rb'


	attr_reader :name

	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
	end

	def print_main_menu
	  puts "[1] Add a new contact"
	  puts "[2] Modify an existing contact"
	  puts "[3] Display all the contacts"
	  puts "[4] Display a contact"
	  puts "[5] Display an attribute"
	  puts "[6] Delete a contact"
	  puts "[7] Exit"
	  puts "Enter a number: "
	end


	def main_menu
		puts "Welcome to #{@name}!"
		#loops unless option 7 is chosen
		while true
			print_main_menu
			input = gets.chomp.to_i
			if input == 7
				puts "Thanks for using this software! Please donate to jimipvyas+paypal@gmail.com via paypal if you enjoyed using it."
				return
			else choose_option(input)
			end
		end
	end

	def choose_option(option)
		case option
		when 1 then add_contact
		when 2 then modify_contact
		when 3 then display_all_contacts
		when 4 then display_contact
		when 5 then display_attribute
		when 6 then delete_contact
		else
			raise "you dun goofed at choose_option with #{option}"
		end
	end

	def display_all_contacts
		@rolodex.contacts.each do |contact|
			puts "#{contact.id + 1}: #{contact.first_name}, #{contact.last_name}, #{contact.email}: #{contact.note}"
		end
	end
	
	def display_attribute
		puts "Please select an option"
		puts "[1] First name"
		puts "[2] Last name"
		puts "[3] Email address"
		puts "[4] Notes"
		input = gets.chomp.to_i
		case input
		when 1...4 then @rolodex.display_attribute(input)
		else "You did not enter a number corresponding to any of those options. Returning you to the main menu."
		end
	end

	def display_contact_with_number
		puts "Please enter the number of the contact you wish to display:"
		input = gets.chomp.to_i
		@rolodex.display_contact(input)
	end
	
	def display_contact
		puts "Do you know the number of the contact you wish to display? Enter Y or N"
		input = gets.chomp.upcase
		case input
		when "Y" 
			display_contact_with_number
		when "N"
			puts "Displaying all contacts:"
			display_all_contacts
			display_contact_with_number
			else puts "You did not enter Y or N. Returning you to the main menu."
		end
	end

	def delete_contact_with_number
		puts "Please enter the number of the contact you wish to delete."
		input = gets.chomp.to_i
		@rolodex.delete_contact(input)
	end


	def delete_contact
		puts "Do you know the number of the contact you wish to delete? Enter Y or N."
		input = gets.chomp.upcase
		case input
		when "Y"
			delete_contact_with_number
		when "N"
			puts "Displaying all contacts:"
			display_all_contacts
			delete_contact_with_number
		end
	end

#this was an idea i had. It does not seem to be posible in Ruby AFAIK.
	# def number_known_check(method)
	# 	puts "Do you know the number of the contact you wish to display? Enter Y or N"
	# 	input = gets.chomp.upcase
	# 	case input
	# 	when "Y" 
	# 		method
	# 	when "N"
	# 		puts "Displaying all contacts:"
	# 		display_all_contacts
	# 		method
	# 		else puts "You did not enter Y or N. Returning you to the main menu."
	# 	end
	# end


	def modify_contact
		display_all_contacts
		puts "Please enter the number of the contact you wish to modify."
		contact_id = gets.chomp.to_i
		print_modify_menu
		puts "Please enter the number of the attribute of the contact you wish to change:"
		attribute = gets.chomp.to_i
		if attribute.between?(1, 4)
			puts "Please enter the modification:"
			modification = gets.chomp
			@rolodex.modify_contact(contact_id, attribute, modification)
		else puts "You have not entered a valid number, please select another option:"
		end

	end

	def print_modify_menu
		puts "[1] Change first name"
		puts "[2] Change last name"
		puts "[3] Change email"
		puts "[4] Change notes"
	end



	def add_contact
		print "First Name: "
		first_name = gets.chomp
		print "Last Name: "
		last_name = gets.chomp
		print "Email: "
		email = gets.chomp
		print "Note: "
		note = gets.chomp
		contact = Contact.new(first_name, last_name, email, note)
		puts "contact created with data:"	
		puts "#{first_name} #{last_name}, #{email}: #{note}"
		@rolodex.add_contact(contact)
	end

end

crm = CRM.new("jimi crm")
crm.main_menu