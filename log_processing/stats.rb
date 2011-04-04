#!/usr/bin/ruby


data = STDIN.read
#puts data.length



module Enumerable
 
  #  sum of an array of numbers
  def sum
    return self.inject(0){|acc,i|acc +i}
  end
 
  #  average of an array of numbers
  def average
    return self.sum/self.length.to_f
  end
 
  #  variance of an array of numbers
  def sample_variance
    avg=self.average
    sum=self.inject(0){|acc,i|acc +(i-avg)**2}
    return(1/self.length.to_f*sum)
  end
 
  #  standard deviation of an array of numbers
  def standard_deviation
    return Math.sqrt(self.sample_variance)
  end
 
end  #  module Enumerable

item = []
data.each do |d|
#2 is used for the current data set, if you want to put all the data comment the if condition  
  if d.to_f > 2
  item << d.to_f 
  #puts d
end
  
end
puts "item count, average and standard deviation"
puts item.count
puts item.average
puts item.standard_deviation

#data.sum
#data.min
#data.max
