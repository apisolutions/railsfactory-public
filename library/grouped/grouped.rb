
class Grouped

def initialize(values)
@values = values.to_a # values must be a flat array
end

def groupcount(val)
    a=@values.sort
    lastvalue = a.rindex(val)
    firstvalue = a.index(val)
    if lastvalue.nil?
      return 0
    else	
      return lastvalue - firstvalue +1
    end
  end
  
  def grouped
    unique_values= @values.uniq
    groupedresult = {}	
    unique_values.each do |value|
      groupedresult[value] = groupcount(value)
    end
    return groupedresult 
  end
 
end 

