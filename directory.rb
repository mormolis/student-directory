
def print_header
    puts "The students of Villains Academy"
    puts "--------------------------------"
end
def print(names)
    names.each do |name|
        puts "#{name[:name]} (#{name[:cohort]} cohort)"
    end
end
#total number of students
def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end
def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    #create an empty array
    students=[]
    name = gets.chomp
    while !name.empty? do
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        name = gets.chomp
    end
    students
end

students = input_students

#printing 
print_header
print(students)
print_footer(students)