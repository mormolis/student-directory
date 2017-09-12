
def print_header
   
    lwidth = 90
    puts "\n"
    puts "*".center(lwidth,"*")
    puts "The students of Villains Academy - November's cohort Students  ".center(lwidth,"*")
    puts "*".center(lwidth,"*")
    print "Name".ljust(lwidth/3)
    print "Country".center(lwidth/3)
    print "Hobby".rjust(lwidth/3)
    puts "\n"
    puts "-".center(lwidth,"-")
end
def print_students(names)
    lwidth = 90
    i=0
    while i<names.length
        print names[i][:name].to_s.ljust(lwidth/3) 
        print names[i][:country].to_s.center(lwidth/3)
        print names[i][:hobby].to_s.rjust(lwidth/3)
        puts
        i+=1
    end
end
#total number of students
def print_footer(names)
    puts "\n\nOverall, we have #{names.count} great students"
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