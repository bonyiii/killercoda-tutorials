#!/usr/bin/env ruby
# 3. for és times

puts "=== for ==="
for i in 1..5
  puts i
end

puts "\n=== times ==="
5.times do |i|
  puts "Iteráció: #{i}"
end

File.write('/tmp/.step_3_for_done', 'done')
