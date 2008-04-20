
  if ARGV.size < 1
    puts "Usage: #{File.basename($0)} filename" 
    puts "octal display"
    puts 'ruby port of linux od command, other options will be available when done'
    exit 1
  end

filename = ARGV[0]
output_filename = ARGV[1]

def print_nonascii(input_file)

  line_number = 1
  non_ascii_count = 0
if File.file? input_file 
  open(input_file).each_line {  |x| 
  column = 0
x.each_byte {|a| 
column += 1
if (0..127).include? a
print a.chr
else
print "\n #{line_number},#{column} : "
print a,"\n"
non_ascii_count += 1
end
#print  " "
}

  line_number += 1
#print "\n"
} #.to_i.chr

puts "\ntotal non ascii characters found: #{non_ascii_count}"
end 

end

def clean_nonascii(input_file,output_file)
  f = open(output_file,'w')
 if File.file? input_file 
  open(input_file).each_line {  |x| 

x.each_byte {|a| 
if (0..127).include? a
#print a.chr
f.print a.chr
else
#print a
end
#print  " "
}
#print "\n"
} #.to_i.chr
end  
 f.close
end 


puts filename
puts output_filename
unless output_filename.nil?
clean_nonascii(filename,output_filename)
else
print_nonascii(filename)
end

