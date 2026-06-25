# 2. `for` és `times`

A `for` ciklus végigiterál egy tartományon vagy tömbön:

```ruby
for i in 1..5
  puts i
end
```

A `times` egy egyszerű számlálóciklus:

```ruby
5.times do |i|
  puts "Iteráció: #{i}"
end
```

> Próbálja ki: `ruby ~/code/step_2_for.rb` — a lépés akkor teljesül, ha a script lefut.
