#!/usr/bin/env ruby
# 2. loop

puts "=== loop with break ==="
i = 0
loop do
  puts i
  i += 1
  break if i >= 5
end

puts "\n=== loop with next ==="
j = 0
loop do
  j += 1
  next if j.even?
  puts j
  break if j >= 7
end

File.write('/tmp/.step_2_loop_done', 'done')
