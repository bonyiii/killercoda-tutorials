# 1. Minden Épuletanyag

> **Alapelv:** A ház MINDEN alkatrésze épületanyag — téglától a csavarig. Ruby-ban MINDEN érték objektum. Nincsenek primitív típusok!

## 1.1 Nézd meg bárminek az osztályát!

Minden Ruby-értéken hívhatsz `.class`-t:

`ruby -e 'puts 42.class'`{{exec}}

`ruby -e 'puts 3.14.class'`{{exec}}

`ruby -e 'puts "tégla".class'`{{exec}}

`ruby -e 'puts true.class'`{{exec}}

`ruby -e 'puts nil.class'`{{exec}}

`ruby -e 'puts [1, 2, 3].class'`{{exec}}

`ruby -e 'puts /regex/.class'`{{exec}}

Próbáld ki egyszerre:

```ruby
# Minden érték objektum!
valtozok = [42, 3.14, "tégla", true, false, nil, [1,2], {a:1}, :szimbolum]
valtozok.each { |v| puts "#{v.inspect} -> #{v.class}" }
```{{exec}}

## 1.2 Metódusláncok — Objektumok egymásba ágyazása

Minden metódus egy objektumot ad vissza, amire újabb metódust hívhatsz:

`ruby -e 'puts "  house  ".strip.upcase.reverse'`{{exec}}

Bontsuk szét:

```ruby
szoveg = "  house  "
puts szoveg.strip          # => "house"
puts szoveg.strip.upcase   # => "HOUSE"
puts szoveg.strip.upcase.reverse  # => "ESUOH"
```{{exec}}

A `Class` osztály is egy objektum:

`ruby -e 'puts "ruby".class.class.class'`{{exec}}

## 1.3 Metódusok minden típuson

```ruby
# Integer metódusok
puts (-5).abs        # => 5
puts 5.next          # => 6
puts 5.even?         # => false
5.times { print "beep " }
puts
```{{exec}}

```ruby
# String metódusok
puts "house".capitalize
puts "brick".reverse
puts "room".length
puts "42".to_i + 8
```{{exec}}

```ruby
# Array metódusok
puts ["brick", "wood"].length
puts ["a", "b", "a"].uniq.join(", ")
```{{exec}}

## Próbáld ki magad!

Írd be az alábbi parancsot, majd kísérletezz saját ötletekkel:

`irb`{{exec}}

Néhány ötlet:
- `"Ruby".length`
- `[1, 2, 3, 4, 5].sum`
- `"hello".upcase.reverse`
- `42.to_s.reverse`

> **Föbb pont:** Ruby-ban még a `nil`, `true`, `false` is objektumok. Ezért hívhatsz rajtuk metódusokat — pl. `nil.nil?` # => `true`

Lépj tovább ha készen állsz!
