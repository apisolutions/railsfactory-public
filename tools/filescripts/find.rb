#!/usr/bin/ruby

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
    puts '.css url\(\.\. # find bad css using ../ notation for images in url()'
    puts '.rhtml class=\"linkblue11\" # find  usage of a css class in all templates'
    puts '.rhtml \'style\' # find  usage of deprecated(coding standards) style tag'
    
    exit 1
  end
  
  require 'rubygems'
  require 'rake'
  FileList["**/*#{ext}"].egrep(Regexp.new(ARGV.join('|')))