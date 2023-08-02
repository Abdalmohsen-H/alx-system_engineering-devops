#!/usr/bin/env ruby
#another solution
#from_starting_string = "[from:"
#from_ending_string = "]"
#puts ARGV[0].scan(/#{Regexp.escape(from_starting_string)}(.*?)#{Regexp.escape(from_ending_string)}/).join(',')

puts ARGV[0].scan(/\[from:(.*?)\] \[to:(.*?)\] \[flags:(.*?)\]/).join(',')

#another solution
#puts ARGV[0].scan(/\[from:(.*?)\]\s\[to:(.*?)\]\s\[flags:(.*?)\]/).join(',')

# regexp that match sender, reciver, flags
