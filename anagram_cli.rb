require_relative 'lib/anagrams'

print 'Enter the file: '
input = gets.chomp
puts ''

begin
  anagrams = Anagrams.new(input)
rescue StandardError => e
  puts "An error of type #{e.class} happened, message is: #{e.message}"
  exit
end

anagrams.find_anagrams.values.select { |word_values| word_values.length > 1 }.each do |items|
  puts items.join(' ')
end
