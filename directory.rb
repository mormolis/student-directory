@students=[]
def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = gets.chomp
    while !name.empty? do
        @students << {name: name, cohort: :november}
        puts "Now we have #{@students.count} students"
        # get another name from the user
        name = gets.chomp
    end
end
  
def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_students_list
    @students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer 
    puts "Overall, we have #{@students.count} great students"
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save students to students.csv"
    puts "4. Load students from students.csv"
    puts "9. Exit" 
end
def show_students
    if @students.size > 0
        print_header
        print_students_list
        print_footer
    else
        puts "No students inputted!"
    end
end
def process(selection)
    case selection
    when "1"
        input_students
    when "2"
        show_students
    when "3"
        save_students
    when "4"
        load_students
    when "9"
        exit 
    else
        puts "I don't know what you meant, try again"
    end
end
def load_students
    begin
        file = File.open("students.csv", "r")
        
        file.readlines.each do |line|
            
            name, cohort = line.chomp.split(",")
            @students << {name: name, cohort: cohort.to_sym}
        end
        puts "\nStudents loaded from file\n\n"
        file.close
    rescue
        puts "Could not open file, or file not found"
    end
end

def interactive_menu
    loop do
        print_menu
        selection = gets.chomp
        process(selection)
    end
end

def save_students
    file = File.open("students.csv", "w")
    @students.each { |student| file.puts "#{student[:name]},#{student[:cohort]}"}    
    file.close
end


interactive_menu
  

  