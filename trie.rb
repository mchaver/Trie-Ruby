words = ["to", "tea", "ted", "ten", "i", "in", "inn"]

class Trie
  attr_reader :root
  def initialize
    @root = Hash.new
  end
  
  def add(word)
    node = @root
    word.downcase!
    word.each_char do |letter|
      node[letter] ||= Hash.new
      node = node[letter]
    end
    node[:end] = true
  end
  
  def build(words)
    words.each do |word|
      self.add(word)
    end
  end
  
  def find(word)
    node = @root
    word.downcase!
    word.each_char do |letter|
      #if false will return nil, otherwise node = node[letter]
      return nil unless node = node[letter]
    end
    node[:end] && true
  end
end