output = %x{ps axww -o 'pid command'}
output.each do |o|

if o.include? "dispatch.fcgi"
#a = o.split[" "]
#y= %x{kill -9 }
puts "kill -9 " + o.to_i.to_s
end

end
