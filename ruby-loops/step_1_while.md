# 1. `while` és `until`

A `while` ciklus addig fut, amíg a feltétel igaz (`true`).

```ruby
i = 0
while i < 5
  puts i
  i += 1
end
```

Az `until` a fordítottja: addig fut, amíg a feltétel hamis (`false`).

```ruby
i = 0
until i == 5
  puts i
  i += 1
end
```

> Próbálja ki: `ruby ~/code/step_1_while.rb`

## Feladat

Szerkessze a `~/code/step_1_challenge.rb` fájlt, és írjon egy `while` ciklust, amely **8-szor** kiírja: `Hello World!` — a lépés akkor teljesül, ha a ciklus 8-szor írja ki a `Hello World!` szöveget.


> A fájl automatikusan mentődik, Ha végzett a feladattal kattintson a "CHECK" gombra.
