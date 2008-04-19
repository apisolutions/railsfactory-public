
=begin
append all css
append all js
append all rhtml
=end
  exts = ['.css']
  if ARGV[0] =~ /^\.[a-zA-Z0-9]+$/
    exts = []
    while ARGV[0] =~ /^\.[a-zA-Z0-9]+$/
      exts << ARGV.shift
    end
  end

  ext = "{" + exts.join(',') + "}" 

content = ""

require 'rake'

case exts.first
when '.css'
files = FileList["public/stylesheets/*.css"]
when '.rhtml'
files = FileList["app/views/**/*.rhtml"]
when '.js'
files = FileList["public/stylesheets/*.js"]
else
files = FileList["**/*#{ext}"]


end


files.each do |f|
  puts f
  sourcefile = File.new(f, "r")
  sourcefile.each_line {|line| content << line}
 
end 

out_file =  File.new("output#{exts.first}", "w")
out_file.puts content
out_file.close