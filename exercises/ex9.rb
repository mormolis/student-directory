
def print_header
    puts "The students of Villains Academy"
    puts "--------------------------------"
end
def print(names)
    # names.each_with_index do |name, i|
    #     puts "#{i+1}. #{name[:name]} (#{name[:cohort]} cohort)"
    # end
    cohort_list=[]
    names.each{|name| cohort_list << name[:cohort] if !cohort_list.include?(name[:cohort])}
    i=0
    cohort_list.each do |coh|  
        puts "\n#{coh}'s Cohort Students"
        names.each do |name| 
            if name[:cohort] == coh
                puts "#{i+1}. #{name[:name]}" 
                i+=1
            end
        end
    end
end
#total number of students
def print_footer(names)
    if names.count == 1
        puts "Overall, we have #{names.count} great student"
    else
        puts "Overall, we have #{names.count} great students"
    end  
end
def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    #create an empty array
    students=[]
    name = gets.chomp
    while !name.empty? do
        puts "Please enter cohort"
        cohort = gets.chomp.to_sym
        if cohort.empty?
            cohort = :november 
        end
        temp_hash = Hash.new{|hash,key| hash[key] = :none}
        temp_hash[:name] = name
        temp_hash[:cohort] = cohort
        students << temp_hash
        if students.count == 1
            puts "Now we have #{students.count} student"
        else
            puts "Now we have #{students.count} students"
        end
            
        puts "\nPlease enter name"
        name = gets.chomp
    end
    students
end

students = input_students

#printing 
print_header
print(students)
print_footer(students)