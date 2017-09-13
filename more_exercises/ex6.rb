@students = [] # an empty array accessible to all methods

def print_menu
    puts "User's Menu\n-----------"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit" # 9 because we'll be adding more items
end

def get_menu_selection
  loop do
    print_menu
    print "Please type a number corresponding to the menu: "
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    puts "Bye!"
    exit # this will cause the program to terminate
  when "3"
    print "Please enter a fileme to save the students: "
    filename=gets.chomp
    save_students_to_file(filename)
  when "4"
    print "Please enter a filename to load students from: "
    filename = gets.chomp
    load_students_from_file(filename)
  else
    puts "\nI don't know what you meant, try again\n"
  end
end

def parse_students_details(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "\n\nPlease enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    
    parse_students_details(name, "november")
    puts "Now we have #{@students.count} students including #{name}\n\n"
    # get another name from the user
    puts "Please enter another name or hit enter again to return to the menu"
    name = STDIN.gets.chomp
  end
  puts "Students's list was populated.\nPlease be aware that the file was not updated!\n\n"
end



def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "\n\nThe students of Villains Academy"
  puts "-------------"
end

def print_student_list
    
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
  
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
  puts "\n\n"
end

def save_students_to_file(filename)   # made it more descriptive 
  # open the file for writing
   File.open(filename, "w") do |file|
    @students.each{ |student| file.puts "#{student[:name]},#{student[:cohort]}"}
   end
  puts "File updated successfully!"
end

def load_students_from_file(filename = "students.csv") #made the method's name more descriptive
    File.open(filename, "r") do |file|
        @students.clear #to avoid the duplicates
        file.readlines.each do |line|
            name, cohort = line.chomp.split(',')
            parse_students_details(name, cohort)
        end
    end
    puts "\n\nStudents' list was populated from #{filename} successfully!\n\n"
end

def try_load_students
  filename = ARGV.first# first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students_from_file(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
load_students_from_file 
get_menu_selection