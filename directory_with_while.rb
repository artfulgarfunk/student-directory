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
  y = students.count
  x = 0
  while x <= y-1
    puts "#{x+1}. #{students[x]}"
    x += 1
  end
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

def select_less_than(students)
  less_twelve = []
  students.each { |x|
      if x[:name].length <= 11
      less_twelve << x
      else
      end
    }
    puts "These are less than twelve...", less_twelve
end


students = input_students
student_count = students.count
print_header
print(students)
print_footer(students)
#select_first_letter(students)
#select_less_than(students)
