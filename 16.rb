#!/usr/bin/ruby -w

puts( (2**1000).to_s.split('').inject(0){|sum,n|sum + n.to_i} )
#=> 1366
