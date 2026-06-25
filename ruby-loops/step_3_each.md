# 3. `each` — Belső Iterátor

Az `each` a Ruby leggyakoribb iterátora. Nem kell kézzel kezelni a számlálót:

```ruby
[10, 20, 30].each do |elem|
  puts elem * 2
end
```

Sztring karakterein is végigmehetünk:

```ruby
"ruby".each_char { |c| puts c.upcase }
```

> Próbálja ki: `ruby ~/code/step_3_each.rb` — a lépés akkor teljesül, ha a script lefut.
