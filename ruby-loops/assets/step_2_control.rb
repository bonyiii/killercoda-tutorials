#!/usr/bin/env ruby
# 2. Vezérlő kulcsszavak

puts "=== break ==="
result = [1, 2, 3, 4, 5].each do |num|
  break num if num > 3
  puts num
end
puts "break visszatérési érték: #{result}"

puts "\n=== next ==="
for i in 1..5
  next if i.even?
  puts i
end

puts "\n=== redo (A szám amire gondoltam: 2) ==="
1.times do |i|
  print "Adj meg a számot amire gondoltam: "
  input = gets.chomp.to_i
  unless input == 2
    puts "Érvénytelen! Próbáld újra."
    redo
  end
  puts "Megadott szám: #{input}"
end
