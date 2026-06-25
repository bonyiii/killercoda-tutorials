#!/usr/bin/env ruby
# 7. upto, downto, step

print "upto: "
1.upto(5)   { |i| print "#{i} " }
puts

print "downto: "
10.downto(1) { |i| print "#{i} " }
puts

print "step: "
0.step(10, 2) { |i| print "#{i} " }
puts

File.write('/tmp/.step_7_upto_done', 'done')
