#!/usr/bin/env ruby
# 8. Blocks, Proc és lambda

duplaz = Proc.new { |n| n * 2 }
puts "Proc map: #{[1, 2, 3].map(&duplaz).inspect}"

negyzet = lambda { |n| n ** 2 }
puts "lambda map: #{[2, 3, 4].map(&negyzet).inspect}"

# Symbol to_proc rövidítés
puts "Symbol &: #{['ruby', 'loops'].map(&:upcase).inspect}"

File.write('/tmp/.step_8_blocks_done', 'done')
