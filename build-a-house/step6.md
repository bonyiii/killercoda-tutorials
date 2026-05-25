# 6. Polimorfizmus — Sok Forma, Ugyanaz az Üzenet

> Különbözo szobák (objektumok) másképp reagálnak ugyanarra a `use_room` üzenetre. Konyha → Főzés, Hálószoba → Alvás.

## Kód betöltése IRB-ben

1. Indítsd el az IRB-t: `irb`{{exec}}
2. Töltsd be: `load "/root/code/step6.rb"`
3. Próbáld ki:

```ruby
get_cozy(Kitchen.new)
get_cozy(Bedroom.new)
```

## 6.1 Alap polimorfizmus

```ruby
class Kitchen
  def use_room
    "Készül az ebéd."
  end
end

class Bedroom
  def use_room
    "Békésen alszom."
  end
end

def get_cozy(room)
  puts room.use_room
end

get_cozy(Kitchen.new)   # => Készül az ebéd.
get_cozy(Bedroom.new)   # => Békésen alszom.
```{{exec}}

## 6.2 Biztonságos polimorfizmus `respond_to?`-val

```ruby
def safe_get_cozy(room)
  if room.respond_to?(:use_room)
    room.use_room
  else
    "This object cannot be used as a room"
  end
end

puts safe_get_cozy(Kitchen.new)
puts safe_get_cozy("string")
```{{exec}}

## 6.3 A rossz megközelítés (ne így csináld!)

```ruby
def bad_get_cozy(room)
  case room.class.name
  when "Kitchen"  then "Főzés..."
  when "Bedroom"  then "Alvás..."
  else "Ismeretlen"
  end
end

puts bad_get_cozy(Kitchen.new)
# Ha új szoba jön, módosítani kell a függvényt!
```{{exec}}

## Gyakorló feladat

Készíts egy `LivingRoom` osztályt `use_room` metódussal! Próbáld ki a `get_cozy` függvénnyel!

<details><summary>Megoldás</summary>

```ruby
class LivingRoom
  def use_room
    "TV nézés"
  end
end

get_cozy(LivingRoom.new)
```{{exec}}

</details>

> **Ruby filozófia:** Az számít, hogy az objektum **MIT TUD CSINÁLNI** (`use_room`), nem pedig az, hogy **MI AZ**. Ez vezet el a Duck Typing-hoz!
