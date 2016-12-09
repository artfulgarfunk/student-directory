# So meta...
# META EVEN THIS ACRONYM!!

puts __FILE__

File.read(__FILE__)

file = File.open(__FILE__, mode = 'r') { |file|
    file.readlines.each do |line|
      puts line
    end
  }
