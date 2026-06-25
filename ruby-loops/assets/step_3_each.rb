#!/usr/bin/env ruby
# 3. each

puts "=== each on array ==="
[10, 20, 30].each do |elem|
  puts elem * 2
end

puts "\n=== each_char ==="
"ruby".each_char { |c| puts c.upcase }

File.write('/tmp/.step_3_each_done', 'done')
