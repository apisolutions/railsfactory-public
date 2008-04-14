we faced some peculiar problems with svn especially on the rhtml file(now these are called .html.erb), not sure about exact culprit, we cut never nail it directly , but it was a combination of Microsoft Word, Dreamweaver, Mac, and svn, and copy paste from browsers.

the svn template will not compile would crash the server.

so the possible solution was to identify all the culprits, and clear them off

usage 
ruby filelisting.rb > scan.txt

also tried to see if the generated ruby is syntactically correct.

I prefer the partials to contain the whole code block so that the compile always passes, thats how I prefer my developers to code


known issues:
since erb is used directly, standard error is not captured and will occassionally generate some strange file, based on syntax, which could be deleted easily

od2
inspired from  linux od command
http://linux.about.com/library/cmd/blcmdl_od.htm

displays the file and line number and the octal character representation of the non-ASCII characters




fic.rb

got that code from site which I dont remember, would update when I do a search, but it stands for find in code

usage 
ruby fic.rb <regular expression to search>

but I prefer another version which I use more frequently and I call it find, again core code was referred from some other author, but it is pretty much useful

