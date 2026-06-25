# 7. `upto`, `downto`, `step`

Ezek a numerikus osztály metódusai elegáns ciklusokat adnak:

```ruby
1.upto(5)   { |i| print "#{i} " }   # 1 2 3 4 5
10.downto(1) { |i| print "#{i} " } # 10 9 8 7 6 5 4 3 2 1
0.step(10, 2) { |i| print "#{i} " } # 0 2 4 6 8 10
```

> Próbálja ki: `ruby ~/code/step_7_upto.rb` — a lépés akkor teljesül, ha a script lefut.
