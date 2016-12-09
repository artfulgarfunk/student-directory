# So meta...
# META EVEN THIS ACRONYM!!

file = File.open(__FILE__, mode = 'r') { |file|
    file.readlines.each do |line|
      puts line
    end
  }
