# 2. A vezérlő kulcsszavak

## 1. `break` – Kilépés a ciklusból

A `break` utasítás azonnal kilép a legbelső ciklusból vagy blokkból. A vezérlés a ciklust lezáró `end` utáni első sorra kerül. Opcionálisan átadhatunk egy értéket, amely a ciklus visszatérési értéke lesz.

```ruby
[1, 2, 3, 4, 5].each do |num|
  break num if num > 3
  puts num
end
# Kimenet: 1, 2, 3
# Visszatérési érték: 4
```

## 2. `next` – Következő iteráció

A `next` (más nyelvekben `continue`) kihagyja a jelenlegi iteráció hátralévő részét, és azonnal a következő elemre lép. Ez nem lépteti a ciklusszámlálót `for` ciklusokban, de iterátoroknál a következő elemet veszi elő.

```ruby
for i in 1..5
  next if i.even?
  puts i
end
# Kimenet: 1, 3, 5 (a páros számok kimaradnak)
```

## 3. `redo` – Jelenlegi iteráció újraindítása

A `redo` újra végrehajtja a jelenlegi iterációt a blokk elejétől, anélkül, hogy újraellenőrizné a ciklusfeltételt vagy a következő elemet kérné le. Ez különösen hasznos bemenetvalidálásnál vagy hibakezelésnél, amikor ugyanazt a lépést meg kell ismételni.

```ruby
3.times do |i|
  print "Adj meg egy pozitív számot: "
  input = gets.chomp.to_i
  if input <= 0
    puts "Érvénytelen! Próbáld újra."
    redo # Újra kéri ugyanabban a körben
  end
  puts "Megadott szám: #{input}"
end
```

> Próbálja ki: `ruby ~/code/step_2_control.rb`
