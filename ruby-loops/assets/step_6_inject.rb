#!/usr/bin/env ruby
# 6. inject és reduce

osszeg = [1, 2, 3, 4, 5].inject(0) { |acc, n| acc + n }
puts "Összeg: #{osszeg}"

sztring = ["R", "u", "b", "y"].reduce("") { |acc, c| acc + c }
puts "Sztring: #{sztring}"

File.write('/tmp/.step_6_inject_done', 'done')
