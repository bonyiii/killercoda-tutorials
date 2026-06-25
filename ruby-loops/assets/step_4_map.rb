#!/usr/bin/env ruby
# 4. map és collect

szamok = [1, 2, 3, 4]
duplazott = szamok.map { |n| n * 2 }
puts duplazott.inspect

# collect alias
negyzet = szamok.collect { |n| n ** 2 }
puts negyzet.inspect

File.write('/tmp/.step_4_map_done', 'done')
