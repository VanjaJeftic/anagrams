require_relative 'lib/anagrams'

print 'Enter the file: '
file = gets.chomp
puts ''

# begin
anagrams = Anagrams.new(file)
# rescue StandardError => e
#  puts "An error of type #{e.class} happened, message is: #{e.message}"
#  exit
# end

puts anagrams.to_s
