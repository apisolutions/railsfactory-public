require 'grouped'
require 'pp'

def g(v)
 Grouped.new(v).grouped
end 

#sample datas
a1 = [5,10,5,4,4,4,2,4,5]
a2 = ["a","aa","b","a","c","aa"]
a3 =nil #those nasty conditions, which can return nil
a4 = 1 # ignore the warning for now
a5 = "5" #if it returned plain string instead of array

pp g(a1)
pp g(a2)
pp g(nil)
pp g(1)
pp g("5")

#to deal with Active record results which return many attributes
#convert it to a array then process it
=begin
@alphabets = Restaurant.find_by_sql("select UPPER(LEFT(name, 1)) as  alphabet from restaurants")
chars = @alphabets.collect {|n| n.alphabet}

user_ratings = Ratings.find_rated_by(id)

this helped build a reputation of how many members rated a user by the rating criteria (rated highly, average, dissatisfied etc), and was made into a graph and shown

simple reason being average may not be the best

=end    