 #!/usr/bin/env ruby
  # -*- ruby -*-

  exts = ['.rb']
  if ARGV[0] =~ /^\.[a-zA-Z0-9]+$/
    exts = []
    while ARGV[0] =~ /^\.[a-zA-Z0-9]+$/
      exts << ARGV.shift
    end
  end

  ext = "{" + exts.join(',') + "}" 

  if ARGV.size < 1
    puts "Usage: #{File.basename($0)} [.ext ...] pattern ..." 
    puts "Example"
    puts '.rhtml # prints lines where non ascii characters exists '
 
    
    exit 1
  end

  
def print_nonascii(input_file)

  line_number = 1
  non_ascii_count = 0
if File.file? input_file 
  open(input_file).each_line {  |x| 
  column = 0
x.each_byte {|a| 
column += 1
if (0..127).include? a
#print a.chr
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

require 'rake'
  FileList["**/*#{ext}"].each do |filename|
    puts filename
  print_nonascii(filename)
  
  end
