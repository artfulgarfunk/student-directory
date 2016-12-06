
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first names
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
    students.each_with_index { |student, index|
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def select_first_letter(students)
  puts "do you want to sort by letter?"
  input=gets.chomp
  if input == "yes"
  sorted_students = []
      puts "What letter?"
      letter = gets.chomp
      students.each { |x|
        if x[:name][0] == letter
        sorted_students << x
        else
        end
        }
    puts sorted_students
  else
  end
end

students = input_students
student_count = students.count
print_header
print(students)
print_footer(students)
select_first_letter(students)
