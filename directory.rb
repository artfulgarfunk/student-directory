@students = []

def load_students(filename = STDIN.gets.chomp)
    file = File.open(filename,mode = 'r') { |file|
      file.readlines.each do |line|
        name, cohort = line.chomp.split(',')
        student_array_add({name: name, cohort: cohort.to_sym})
      end
      }
end

def student_array_add(details)
  @students << (details)
end

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

    #@students << {name: name,cohort: cohort.to_sym,age: age,birthplace: birthplace, hobby: hobby}
    student_array_add({name: name, cohort: cohort.to_sym,age: age, birthplace: birthplace, hobby: hobby})
    puts "Now we have #{@students.count} students".center(50,'--')
    name = STDIN.gets.gsub(/\n/,"")
  end
  @students
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
    puts "Successfully inputted a new student!"
  when "2"
    show_students
  when "3"
    save_students
    puts "Students saved!"
  when "4"
    puts "What is the name of the file?"
    load_students
    print_students_list
    puts "These students are loaded!"
  when "9"
    exit
  else
    puts "try to type a number"
  end
end

def interactive_menu
  loop do
  print_menu
  process(STDIN.gets.chomp)
  end
end
  # 4. repeat from step 1

def print_header
  puts "The students of Villains Academy"
end

def print_students_list
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
  input_cohort = STDIN.gets.gsub(/\n/,"")
  input_cohort = input_cohort.to_sym
  @students.each { |student|
    if student[:cohort] == input_cohort
      cohort_sort << student
    else
    end
  }
  puts cohort_sort
end

def try_load_students
  filename = ARGV.first #this takes the first argument from the command line
  if filename.nil? == true
    puts "Do you want to start a new list?"
    user_input = STDIN.gets.chomp
    if user_input.upcase == "Y"
      return
    else
    load_students("students.csv") #now takes this file as default!
    #to change, just insert filename again, instead of "students.csv" in the above line
    # this will exit the method while filename doesn't exist
    end
  elsif filename.nil? != true
        if File.exists?(filename)
         load_students(filename)
         puts "Loaded #{@students.count} from #{filename}"
        else File.exists?(filename) != true # if it does NOT exist
          puts "Sorry, #{filename} doesn't exist."
          exit #quits!
        end
    end
end

def print_footer
  if @students.count == 1
    maybe_plural = "student"
  else
    maybe_plural = "students"
  end
  footer = "Overall we have #{@students.count} great #{maybe_plural}".center(50,'--')
  puts footer
end

def select_first_letter
  puts "do you want to sort by letter?"..center(50,'--')
  input=STDIN.gets.gsub(/\n/,"")
  if input == "yes"
  sorted_students = []
      puts "What letter?"
      letter = STDIN.gets.gsub(/\n/,"")
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

def save_students
  # open the file for writing
  puts "Enter file name..."
  filename = STDIN.gets.chomp
  file = File.open(filename,"w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line #puts in this form writes to a file, as opposed to the usual output stream
  end
  file.close
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

try_load_students
interactive_menu
print_header
print
#print_by_cohort(students)
print_footer
#select_first_letter(students)
#select_less_than(students)
