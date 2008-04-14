you may hate it you may love it but you cannot ignore dreamhost.

we have immunized ourself with dreamhost problems, though our production apps are running on dedicated servers, amazon EC2's, other VPS, but many of our internal demos , alphas and betas are still running on dreamhost

I would share some of the scripts, code which made that possible

pk.rb

it is supposed to mean process kill

I never thought i this would be the most used script which I ever wrote, written in under 10 minutes, it executes a shell script and gives the list of process ids to be killed

usage
ruby pk.rb
#output 
# kill -9 10237
# kill -9 10239

suggested to use with dreamhost and other sites where you need to kill dispatch.fcgi or modify it to kill ruby, python or other processes





