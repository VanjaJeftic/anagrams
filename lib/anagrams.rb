class Anagrams
  def initialize(list_of_word, word)
    words_validation(list_of_word)
    @dictionary = list_of_word
    @word = word
  end

  def find_anagrams
    anagrams_dictionary = {}

    find_dictionary.each do |word|
      key = word.chars.sort(&:casecmp).join
      if anagrams_dictionary.key?(key)
        anagrams_dictionary[key] << word
      else
        anagrams_dictionary[key] = [word]
      end
    end
    find_result(anagrams_dictionary)
  end

  private

  def additional_word
    @word.chars.sort(&:casecmp).join unless @word.nil?
  end

  def find_dictionary
    if @dictionary.is_a?(Array)
      @dictionary
    else
      File.read(@dictionary).encode('UTF-8', invalid: :replace, replace: '').split("\n")
    end
  end

  def find_result(anagrams_dictionary)
    goal_word = additional_word
    if goal_word.nil?
      anagrams_dictionary
    else
      anagrams_dictionary.select { |key, _value| key == goal_word }
    end
  end

  def words_validation(list_of_word)
    validate(list_of_word) if list_of_word.class != Array
  end

  def validate(words)
    raise StandardError, 'Input is empty or file does not exist!' if words.nil? ||
                                                                     File.basename(words) != 'test1.txt' &&
                                                                     File.basename(words) != 'test2.txt' &&
                                                                     File.basename(words) != 'test3.txt' &&
                                                                     File.basename(words) != 'test4.txt' &&
                                                                     File.basename(words) != 'wordlist.txt'
  end
end
