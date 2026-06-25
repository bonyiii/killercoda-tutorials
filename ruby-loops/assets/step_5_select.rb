#!/usr/bin/env ruby
# 5. select és reject

paros = [1, 2, 3, 4, 5, 6].select { |n| n.even? }
puts "Páros: #{paros.inspect}"

paratlan = [1, 2, 3, 4, 5, 6].reject { |n| n.even? }
puts "Páratlan: #{paratlan.inspect}"

File.write('/tmp/.step_5_select_done', 'done')
