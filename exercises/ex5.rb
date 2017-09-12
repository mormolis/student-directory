
def print_header
    puts "The students of Villains Academy"
    puts "--------------------------------"
end
def print_students(names)
    i=0
    while i<names.length
        puts "#{i+1}. #{names[i][:name]} from #{names[i][:country]} - likes #{names[i][:hobby]} (#{names[i][:cohort]} cohort)"
        i+=1
    end
end
#total number of students
def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end
def input_students
    puts "Please enter names, hobbies and country of birth of the students"
    puts "To finish, just hit return twice"
    #create an empty array
    students=[]
    print "Please enter the name: "
    name = gets.chomp
    print "Please enter a hobby: "
    hobby = gets.chomp
    print "Please enter country of birth: "
    country = gets.chomp
    while true
        students << {name: name, cohort: :november, hobby: hobby, country: country}
        puts "\nNow we have #{students.count} students\n\n"
        print "Please enter the name: "
        name = gets.chomp
        if name.empty?
            break
        end
        print "Please enter a hobby: "
        hobby = gets.chomp
        print "Please enter country of birth: "
        country = gets.chomp
        puts
    end
    students
end

students = input_students

#printing 
print_header
print_students(students) 
print_footer(students)