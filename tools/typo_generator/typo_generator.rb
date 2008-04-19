=begin

typo_builder
I have encountered this requirement many times, when a search is made and the resultset is very small or no results are found, it is suspected the query many have a typing mistake(typo) and we need to provide either alternate search or provide other options which include "did you mean ####"

I have used these techniues in a travel search engine, vertical search engine for real estate, generally applicable to most user generated content

general  suggestions would be based on suggesting synonyms, word stemming etc.

but what required was a method to build those typos, and use it to search effectiveness of algorithms or seed these as equivalent word, I did not use a spellchecker based implementation


Most typos involve simple duplication, omission, transposition, or substitution of a small number of characters.


duplication

entering same character multiple times sequentially

omission 

missing certain characters

transposition

changing certain character of the word

substitution

entering other character 


misspelt generation

this is not a finished or cleaned up code, but a working code extracted.

not object oriented, lots of duplication, scope for refactoring


=end


def word2array(word)
char_array = []
 word.scan( /./ ){|a| char_array  << a }
 return char_array
end

def omission_one_charater(word)

o = []
char_array = word2array(word)

#puts char_array

(1..word.length).to_a.each do |i|
  a = char_array.dup
  a[i-1] = nil
  o << a.compact.join('')
  end
puts o

end

def duplication_one_character(word)
char_array = word2array(word)
length = (word.length) -1
o = []
(0..length).to_a.each do |i|
  duplicated_string = []
  duplicated_string= char_array[0..i] +  char_array[i..length] #char_array[i].to_a +
  o << duplicated_string.join('')
  end
puts o

end

def transposition_one_character(word)
char_array = word2array(word)
length = (word.length) -1
o = []
#puts length

(0..(length-1)).to_a.each do |i|

  duplicated_string = []
  if i >=1
  duplicated_string <<char_array[0..i-1] 
end
  duplicated_string << char_array[i,2].reverse 

unless  (i+1) == length
duplicated_string <<char_array[i+2..length] 
end

  #duplicated_string <<char_array[i+2..length]  unless (i+2) == length
  # char_array[i,2].reverse+  char_array[i..length] #char_array[i].to_a +
  
  o << duplicated_string.join('')
# puts i
#  puts duplicated_string.join('')
  end
puts o
end


 def strip_one_duplicate_character(word)
char_array = word2array(word)
length = (word.length) -1
o = []
(0..length-1).to_a.each do |i|
    duplicated_string=[]
  if char_array[i] ==char_array[i+1]
    duplicated_string = char_array.dup
duplicated_string[i] = nil
end  
  o << duplicated_string.compact.join('') unless duplicated_string == []
end

puts o
end

#=begin
 omission_one_charater("london")
 omission_one_charater("kitchen")
 
 
 duplication_one_character("word")
 duplication_one_character("smart")

 transposition_one_character("america")
 transposition_one_character("london")
 transposition_one_character("londno") #generates the correct by trial and error
#=end  
  strip_one_duplicate_character("wword")
  strip_one_duplicate_character("hello")
  strip_one_duplicate_character("helloo")
