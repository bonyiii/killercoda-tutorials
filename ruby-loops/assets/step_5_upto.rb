#!/usr/bin/env ruby
# 5. times, upto, downto, step

puts "=== times ==="
5.times { |i| puts "Iteráció: #{i}" }

puts "\n=== upto ==="
1.upto(5)   { |i| print "#{i} " }
puts

puts "\n=== downto ==="
10.downto(1) { |i| print "#{i} " }
puts

puts "\n=== step ==="
0.step(10, 2) { |i| print "#{i} " }
puts

File.write('/tmp/.step_5_upto_done', 'done')
