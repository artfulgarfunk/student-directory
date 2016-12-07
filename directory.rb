def input_students
  students = []
  puts "What's the name?"
  name = STDIN.gets.chomp
  while !name.empty? do
    puts "What's the age of the student?"
    age = STDIN.gets.chomp
    puts "Where was the student born?"
    birthplace = STDIN.gets.chomp
    puts "What's their favourite hobby?"
    hobby = STDIN.gets.chomp
    students << {name: name,cohort: :november,age: age,birthplace: birthplace, hobby: hobby}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
    students.each_with_index { |student, index|
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort,
      age: #{student[:age]},
      birthplace: #{student[:birthplace]},
      hobby: #{student[:hobby]})"
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
