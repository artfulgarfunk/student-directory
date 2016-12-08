@students = []

def input_students
  #getting all default values together
  defaults = {
    cohort: "Sometime soon!",
    age: "Between 0 and 100, judging by his face",
    birthplace: "Earth (probably)",
    hobby: "TV I guess",
  }

  months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]

  puts "What's the name?".center(50,'--')
  name = STDIN.gets.gsub(/\n/,"")
  while !name.empty? do
    puts "What cohort is #{name} joining?".center(50,'--')
    cohort = STDIN.gets.gsub(/\n/,"")# cohorts are symbols!
    cohort = cohort.to_sym
      if cohort.empty? != true
        while months.include?(cohort) != true
        puts "You made an error, try again"
        cohort = STDIN.gets.gsub(/\n/,"")
        cohort = cohort.to_sym
        end
      else cohort = defaults[:cohort]
      end

    puts "What's the age of the student?".center(50,'--')
    age = STDIN.gets.gsub(/\n/,"")
      if age.empty? then age = defaults[:age] end

    puts "Where was the student born?".center(50,'--')
    birthplace = STDIN.gets.gsub(/\n/,"")
      if birthplace.empty? then birthplace = defaults[:birthplace] end

    puts "What's their favourite hobby?".center(50,'--')
    hobby = STDIN.gets.gsub(/\n/,"")
      if hobby.empty? then hobby = defaults[:hobby] end

    @students << {name: name,cohort: cohort.to_sym,age: age,birthplace: birthplace, hobby: hobby}
    puts "Now we have #{@students.count} students".center(50,'--')
    name = gets.gsub(/\n/,"")
  end
  @students
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print
  print_footer
end

def interactive_menu
  loop do
  # 1. print the menu and ask the user what to do
  print_menu
  # 2. read the input and save it into a variable
  selection = gets.chomp
  # 3. do what the user has asked, computer
  case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "9"
      exit #get out of the program!
    else
      puts "That doesn't even make sense human"
    end
  end
end
  # 4. repeat from step 1

def print_header
  puts "The students of Villains Academy"
end

def print
    @students.each_with_index { |student, index|
      puts "#{index+1}. #{student[:name]}".center(50,'--')
      puts "Cohort: #{student[:cohort]}".center(50,'--')
      puts "Age: #{student[:age]}".center(50,'--')
      puts "Birthplace: #{student[:birthplace]}".center(50,'--')
      puts "Hobby: #{student[:hobby]}".center(50,'--')
  }
end

def print_by_cohort
  cohort_sort = []
  puts "Which cohort?"
  input_cohort = gets.gsub(/\n/,"")
  input_cohort = input_cohort.to_sym
  @students.each { |student|
    if student[:cohort] == input_cohort
      cohort_sort << student
    else
    end
  }
  puts cohort_sort
end

def print_footer
  if @students.count >= 2
    maybe_plural = "students"
  else
    maybe_plural = "student"
  end
  footer = "Overall we have #{@students.count} great #{maybe_plural}".center(50,'--')
  puts footer
end

def select_first_letter
  puts "do you want to sort by letter?"..center(50,'--')
  input=gets.gsub(/\n/,"")
  if input == "yes"
  sorted_students = []
      puts "What letter?"
      letter = gets.gsub(/\n/,"")
      @students.each { |x|
        if x[:name][0] == letter
        sorted_students << x
        else
        end
        }
    puts sorted_students
  else
  end
end

def select_less_than
  less_twelve = []
  @students.each { |x|
      if x[:name].length <= 11
      less_twelve << x
      else
      end
    }
    puts "These are less than twelve...", less_twelve
end

interactive_menu
print_header
print
#print_by_cohort(students)
print_footer
#select_first_letter(students)
#select_less_than(students)
