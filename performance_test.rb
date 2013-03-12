require './trie.rb'
require 'rbtree'

words = []
hash = Hash.new
trie = Trie.new
rbtree = RBTree.new
start = Time.new
#time from file
#time from array

count = 0
start = Time.new
File.open("comprehensive_english_word_list.txt", "r") do |infile|
  while (line = infile.gets)
    hash[line.chomp]
    count+=1
  end
end
puts count.to_s
puts "Init hash from file: #{Time.now - start} seconds!"

start = Time.new
File.open("comprehensive_english_word_list.txt", "r") do |infile|
  while (line = infile.gets)
    rbtree[line.chomp] = true
  end
end
puts "Init rbtree from file: #{Time.now - start} seconds!"

start = Time.new
File.open("comprehensive_english_word_list.txt", "r") do |infile|
  while (line = infile.gets)
    trie.add(line.chomp)
  end
end
puts "Init trie from file: #{Time.now - start} seconds!"
puts ""
#reset 
hash = Hash.new
trie = Trie.new
rbtree = RBTree.new

File.open("comprehensive_english_word_list.txt", "r") do |infile|
  while (line = infile.gets)
    words.push(line.chomp)
  end  
end

start = Time.new
words.each do |word|
  hash[word] = true
end
puts "Init hash from array: #{Time.now - start} seconds!"

start = Time.new
words.each do |word|
  rbtree[word] = true
end
puts "Init rbtree from array: #{Time.now - start} seconds!"

start = Time.new
words.each do |word|
  trie.add(word)
end
puts "Init trie from array: #{Time.now - start} seconds!"
puts ""
dummy = false
start = Time.new
words.sample(1000000).each do |word|
  dummy = hash[word]
end
puts "Test 1000000 words in a hash: #{Time.now - start} seconds!"

start = Time.new
words.sample(1000000).each do |word|
  dummy = rbtree[word]
end
puts "Test 1000000 words in a rbtree: #{Time.now - start} seconds!"

start = Time.new
words.sample(1000000).each do |word|
  dummy = trie.find(word)
end
puts "Test 1000000 words in a trie: #{Time.now - start} seconds!"
puts ""
start = Time.new
words.sample(1000000).each do |word|
  dummy = hash[word + "abc"]
end
puts "Test 1000000 words not in a hash: #{Time.now - start} seconds!"

start = Time.new
words.sample(1000000).each do |word|
  dummy = rbtree[word + "abc"]
end
puts "Test 1000000 words not in a rbtree: #{Time.now - start} seconds!"

start = Time.new
words.sample(1000000).each do |word|
  dummy = trie.find(word + "abc")
end
puts "Test 1000000 words not in a trie: #{Time.now - start} seconds!"