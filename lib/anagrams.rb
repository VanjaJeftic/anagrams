class Anagrams
  def initialize(text_file)
    @text_file = text_file
  end

  def to_s
    anagram_pairs = []
    find_anagrams.values.select { |word_values| word_values.length > 1 }.each do |item|
      anagram_pairs.push(item.join(' '))
    end
    anagram_pairs
  end

  def find_anagrams
    anagrams_dictionary = {}
    dictionary = anagrams_checker

    dictionary.each do |word|
      key = word.chars.sort(&:casecmp).join
      if anagrams_dictionary.key?(key)
        anagrams_dictionary[key] << word
      else
        anagrams_dictionary[key] = [word]
      end
    end
    anagrams_dictionary
  end

  # def check_file_extension(text_file)
  #  raise StandardError, 'Failed to open the file or file does not exist!' if File.extname(text_file) == '.zip'
  # end

  def anagrams_checker
    if @text_file.is_a?(Array)
      @text_file
    else
      File.read(@text_file).encode('UTF-8', invalid: :replace, replace: '').split("\n")
    end
  end
end
