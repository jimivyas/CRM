
def print_main_menu
  puts "[1] Add a new contact"
  puts "[2] Modify an existing contact"
  puts "[3] Delete a contact"
  puts "[4] Display all the contacts"
  puts "[5] Display an attribute"
  puts "[6] Exit"
  puts "Enter a number: "
end

def main_menu
	print_main_menu
	input = gets.chomp.to_i
end



def get_input
end



main_menu

