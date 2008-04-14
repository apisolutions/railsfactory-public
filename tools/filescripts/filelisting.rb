require 'rake'
 #.egrep(Regexp.new(ARGV.first))
 
   #puts FileList["**/*.rb"]
   
=begin
FileList["**/*.rb"].each do |file|
	   %x{ruby -c #{file}}

end

=end

FileList["app/**/*.rhtml"].each do |file|
puts file
ruby_code = %x{ erb -x  #{file}}
#puts ruby_code
error =  %x{ruby -c -e #{ruby_code}}
puts error
end