# 3. `loop` — Végtelen Ciklus

A `loop` egy végtelen ciklust indít, amelyet a `break` kulcsszóval lehet megszakítani:

```ruby
i = 0
loop do
  puts i
  i += 1
  break if i >= 5
end
```

A `loop` hasznos, amikor nem tudjuk előre a pontos ismétlések számát, és a kilépési feltétel a ciklus törzsében dől el.

> Próbálja ki: `ruby ~/code/step_3_loop.rb`

## Feladat

Szerkessze a `~/code/step_3_challenge.rb` fájlt, és írjon egy `loop` ciklust, amely **5-ször** kiírja: `Ruby loop!` — a lépés akkor teljesül, ha a ciklus pontosan 5-ször írja ki a `Ruby loop!` szöveget.

> A fájl automatikusan mentődik, Ha végzett a feladattal kattintson a "CHECK" gombra.
