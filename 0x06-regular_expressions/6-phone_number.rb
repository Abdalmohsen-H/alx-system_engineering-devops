#!/usr/bin/env ruby
puts ARGV[0].scan(/^\d{10,10}$/).join
# regexp that match exactly  10 digits phone numbers no delimeters in between
