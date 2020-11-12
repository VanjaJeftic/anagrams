require_relative 'lib/anagrams'

input = ARGV

begin
  anagrams = Anagrams.new(input[0], input[1])
rescue StandardError => e
  puts "An error of type #{e.class} happened, message is: #{e.message}"
  exit
end

anagrams.find_anagrams.values.select { |word_values| word_values.length > 1 }.each do |items|
  puts items.join(' ')
end
