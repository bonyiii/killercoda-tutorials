# 4. `map` és `collect`

A `map` (alias: `collect`) új tömböt ad vissza, ahol minden elemet a blokk eredménye helyettesít:

```ruby
szamok = [1, 2, 3, 4]
duplazott = szamok.map { |n| n * 2 }
puts duplazott.inspect
# => [2, 4, 6, 8]
```

> Próbálja ki: `ruby ~/code/step_4_map.rb` — a lépés akkor teljesül, ha a script lefut.
