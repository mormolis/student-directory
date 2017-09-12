
def print_header
    puts "The students of Villains Academy"
    puts "--------------------------------"
end
def print(names, letter)
    names.each_with_index do |name, i|
        if name[:name].to_s[0] == letter
            puts "#{i+1}. #{name[:name]} (#{name[:cohort]} cohort)"
        end
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
print(students, "g") #in this case charachter g
print_footer(students)