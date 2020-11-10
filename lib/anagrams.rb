class Anagrams
  def initialize(input)
    check_input(input)
    @input = input
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

  private

  def check_input(input)
    raise StandardError, 'Input is empty or file does not exist!' if input == '' ||
                                                                     File.basename(input) != 'test1.txt' &&
                                                                     File.basename(input) != 'test2.txt' &&
                                                                     File.basename(input) != 'test3.txt' &&
                                                                     File.basename(input) != 'test4.txt' &&
                                                                     File.basename(input) != 'wordlist.txt'
  end

  def anagrams_checker
    File.read(@input).encode('UTF-8', invalid: :replace, replace: '').split("\n")
  end
end
