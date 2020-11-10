require 'anagrams'

describe Anagrams do
  context 'test1 - anagrams should give result' do
    it 'input parameter file test1.txt' do
      anagrams = Anagrams.new('test1.txt')
      result = { 'ceiprstu' => %w[crepitus cuprites pictures],
                 'aepst' => %w[tapes paste pates septa peats spate] }
      expect(anagrams.find_anagrams).to eql(result)
    end
  end

  context 'test2 - anagrams should give result' do
    it 'input parameter file test2.txt' do
      anagrams = Anagrams.new('test2.txt')
      result = { 'ceiprstu' => %w[pictures crepitus],
                 'opttuu' => %w[output putout],
                 'eilnst' => %w[listen enlist] }
      expect(anagrams.find_anagrams).to eql(result)
    end
  end
  context 'test3 - anagrams should give result' do
    it 'input parameter file test3.txt' do
      anagrams = Anagrams.new('test3.txt')
      result = { 'eilnst' => %w[enlist inlets silent listen],
                 'abeorst' => %w[boaster boaters borates],
                 'eefhrrs' => %w[fresher refresh],
                 'orst' => %w[rots sort] }
      expect(anagrams.find_anagrams).to eql(result)
    end
  end
  context 'test4 - anagrams should give result' do
    it 'input parameter file test4.txt' do
      anagrams = Anagrams.new('test4.txt')
      result = { 'ceiprstu' => %w[crepitus cuprites pictures piecrust],
                 'aepst' => %w[paste pates septa spate tapes tepas peats],
                 'denrssu' => %w[sunders undress] }
      expect(anagrams.find_anagrams).to eql(result)
    end
  end

  context 'empty should give error' do
    it 'input parameter is empty string' do
      expect { Anagrams.new('') }.to raise_error
    end
  end

  context 'file that does not exist should give error' do
    it "input parameter is 'test.txt'" do
      expect { Anagrams.new('test.txt') }.to raise_error
    end
  end
end
