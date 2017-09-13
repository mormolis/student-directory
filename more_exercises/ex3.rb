@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def get_menu_selection
  loop do
    print_menu
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
    exit # this will cause the program to terminate
  when "3"
    save_students_to_file
  when "4"
    load_students
  else
    puts "I don't know what you meant, try again"
  end
end

def parse_students_details(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    
    parse_students_details(name, "november")
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end



def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students_to_file   # made it more descriptive 
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
#   @students.each do |student|              
#     student_data = [student[:name], student[:cohort]]
#     csv_line = student_data.join(",")
#     file.puts csv_line
##### As I did to my version I changed these lines#####
    @students.each{ file.puts "#{student[:name]},#{student[:cohort]}"}
  end
  file.close
end

def load_students_from_file(filename = "students.csv") #made the method's name more descriptive
    file = File.open(filename, "r")
    file.readlines.each do |line|
        name, cohort = line.chomp.split(',')
        parse_students_details(name, cohort)
    end
    file.close
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