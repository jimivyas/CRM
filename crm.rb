class CRM
	def print_main_menu
	  puts "[1] Add a new contact"
	  puts "[2] Modify an existing contact"
	  puts "[3] Display all the contacts"
	  puts "[4] Display all the contacts"
	  puts "[5] Display an attribute"
	  puts "[6] Delete a contact"
	  puts "[7] Exit"
	  puts "Enter a number: "
	end

	def main_menu
		print_main_menu
		input = gets.chomp.to_i
		choose_option(input)
	end

	def choose_option(option)
		case option
		when 1 then add_contact
		when 2 then modify_contact
		when 3 then display_all_contacts
		when 4 then display_contact
		when 5 then display_attribute
		when 6 then delete_contact
		when 7 
			puts "Thanks for using this software! Please donate to jimipvyas+paypal@gmail.com via paypal if you enjoyed using it."
			return
		else
			raise "you dun fucked up at choose_option with #{option}"
		end
	end
end

crm = CRM.new
crm.main_menu



