def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    
    students = []
    
    name = gets.chomp
    
    while !name.empty? do
   
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
    end
    # return the array of students
    students
end
  
def print_header
    puts "The students of my cohort at Makers Academy"
    puts "-------------"
end

def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer names
    puts "Overall, we have #{names.count} great students"
end

def interactive_menu
    students = []
    loop do
        
        puts "1. Input the students"
        puts "2. Show the students"
        puts "9. Exit" 
        selection = gets.chomp
        
        case selection
            when "1"
                students += input_students
            when "2"
                if students.size > 0
                    print_header
                    print(students)
                    print_footer(students)
                else
                    puts "No students inputted!"
                end
            when "9"
                exit 
            else
                puts "I don't know what you meant, try again"
        end
    end
end

interactive_menu
  

  