#!/usr/bin/env ruby
puts ARGV[0].scan(/^h.n$/).join
# regexp string that start with letter h ends with n, also must have one char in the middle
