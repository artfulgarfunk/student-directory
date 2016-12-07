def input_students
  students = []
  #getting all default values together
  defaults = {
    cohort: "Sometime soon!",
    age: "Between 0 and 100, probably",
    birthplace: "Earth (probably)",
    hobby: "TV I guess",
  }

  months = ["january","february","march","april","may","june","july","august","september","october","november","december"]

  puts "What's the name?".center(50,'--')
  name = STDIN.gets.chomp
  while !name.empty? do
    puts "What cohort is #{name} joining?".center(50,'--')
    cohort = STDIN.gets.chomp # cohorts are symbols!
      if cohort.empty? != true
        while months.include?(cohort) != true
        puts "You made an error, try again"
        cohort = STDIN.gets.chomp
        end
      else cohort = defaults[:cohort]
      end
    puts "What's the age of the student?".center(50,'--')
    age = STDIN.gets.chomp
      if age.empty? then age = defaults[:age] end
    puts "Where was the student born?".center(50,'--')
    birthplace = STDIN.gets.chomp
      if birthplace.empty? then birthplace = defaults[:birthplace] end
    puts "What's their favourite hobby?".center(50,'--')
    hobby = STDIN.gets.chomp
      if hobby.empty? then hobby = defaults[:hobby] end
    students << {name: name,cohort: cohort.to_sym,age: age,birthplace: birthplace, hobby: hobby}
    puts "Now we have #{students.count} students".center(50,'--')
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
end

def print(students)
    students.each_with_index { |student, index|
      puts "#{index+1}. #{student[:name]}".center(50,'--')
      puts "Cohort: #{student[:cohort]}".center(50,'--')
      puts "Age: #{student[:age]}".center(50,'--')
      puts "Birthplace: #{student[:birthplace]}".center(50,'--')
      puts "Hobby: #{student[:hobby]}".center(50,'--')
  }
end


def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50,'--')
end

def select_first_letter(students)
  puts "do you want to sort by letter?"..center(50,'--')
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
