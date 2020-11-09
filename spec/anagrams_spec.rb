require 'anagrams'

describe Anagrams do
  describe 'array_input check' do
    it 'input parameter is array' do
      anagrams = Anagrams.new(%w[pictures refresh fresher piecrust])
      expect(anagrams.find_anagrams).to eql({ 'ceiprstu' => %w[pictures piecrust], 'eefhrrs' => %w[refresh fresher] })
    end
  end
end
