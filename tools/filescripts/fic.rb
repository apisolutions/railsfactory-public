#!/usr/bin/env ruby
  require 'rake'
  FileList["**/*.rb"].egrep(Regexp.new(ARGV.first))