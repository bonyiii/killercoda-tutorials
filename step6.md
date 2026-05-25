# 6. Polimorfizmus — Sok Forma, Ugyanaz az Üzenet

> Különbözo szobák (objektumok) másképp reagálnak ugyanarra az üzenetre. A Ruby nem azt nézi, hogy MI AZ objektum, hanem hogy MIT TUD.

## 6.1 Alap polimorfizmus

```ruby
class Kitchen
  def use_room
    "Cooking a delicious meal"
  end
end

class Bedroom
  def use_room
    "Sleeping peacefully"
  end
end

class Bathroom
  def use_room
    "Taking a relaxing bath"
  end
end

# EGY függvény, BÁRMELY szobához
def get_cozy(room)
  puts room.use_room   # <- polimorf hívás!
end

get_cozy(Kitchen.new)
get_cozy(Bedroom.new)
get_cozy(Bathroom.new)
```{{exec}}

## 6.2 Objektumok gyüjteménye

A polimorfizmus ereje gyüjteményekben mutatkozik meg:

```ruby
rooms = [Kitchen.new, Bedroom.new, Bathroom.new,
         Kitchen.new, Bedroom.new]

rooms.each_with_index do |room, i|
  puts "#{i+1}. #{room.use_room}"
end
```{{exec}}

## 6.3 Biztonságos polimorfizmus `respond_to?`-val

```ruby
def safe_get_cozy(room)
  if room.respond_to?(:use_room)
    room.use_room
  else
    "This object cannot be used as a room"
  end
end

puts safe_get_cozy(Kitchen.new)  # => "Cooking..."
puts safe_get_cozy("string")     # => "This object cannot..."
```{{exec}}

## 6.4 A rossz megközelítés (ne így csináld!)

```ruby
def bad_get_cozy(room)
  case room.class.name
  when "Kitchen"  then "Cooking..."
  when "Bedroom"  then "Sleeping..."
  else "Unknown"
  end
end

# Ez NEM polimorf! Ha új szoba jön, módosítani kell a függvényt.
puts bad_get_cozy(Kitchen.new)
```{{exec}}

## Gyakorló feladat

Készíts egy `LivingRoom` osztályt `use_room` metódussal, ami azt írja ki: "Watching TV". Próbáld ki a `get_cozy` függvénnyel!

<details><summary>Megoldás</summary>

```ruby
class LivingRoom
  def use_room
    "Watching TV"
  end
end

get_cozy(LivingRoom.new)
```{{exec}}

</details>

> **Ruby filozófia:** Az számít, hogy az objektum **MIT TUD CSINÁLNI** (`use_room`), nem pedig az, hogy **MI AZ** (`Kitchen`, `Bedroom`). Ez vezet el a Duck Typing-hoz!
