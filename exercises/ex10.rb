s1="Hello\n"
p s1
s2 = "Hello\n"
p s2
s3 = "Hello\n"
p s3

if s1.chomp == s2.chop && s1.chomp == s3.delete("\n")
    puts "The methods we are looking for are: chop (no arguments) and delete(\"\\n\")"
end