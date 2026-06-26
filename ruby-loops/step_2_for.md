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

> Próbálja ki: `ruby ~/code/step_2_for.rb`

## Feladat

Szerkessze a `~/code/step_2_challenge.rb` fájlt, és írjon egy `for` ciklust, amely végigmegy a `1..10` tartományon. Minden számhoz írja ki: `SZÁM: SZÁM x 2`  
Például: `1: 2`, `2: 4`, `3: 6`, ... `10: 20` — a lépés akkor teljesül, ha a kimenet pontosan a fenti 10 sort tartalmazza.

> A fájl automatikusan mentődik, Ha végzett a feladattal kattintson a "CHECK" gombra.
