# 3. Öröklodés — A Tervrajz Újrafelhasználása

> **IS-A Kapcsolat:** Ház IS-A Épulet, Garázs IS-A Épulet. A közös kód a szüloben (`Building`), az egyedi a gyermekekben.

## Kód betöltése IRB-ben

1. Indítsd el az IRB-t: `irb`{{exec}}
2. Töltsd be: `load "/root/code/step3.rb"`
3. Próbáld ki:

```ruby
h = House.new(2500, "concrete", 2)
g = Garage.new(400, "wood")
puts h.describe
puts g.park_car
puts House.ancestors
```

## 3.1 Alap öröklodés — Építmények hierarchiája

```ruby
# ==== SZÜLO OSZTÁLY ====
class Building
  attr_accessor :area, :material, :floors

  def initialize(area, material, floors = 1)
    @area = area
    @material = material
    @floors = floors
  end

  def describe
    "#{@area} sqft #{@material} building, #{@floors} floor(s)"
  end

  def structural_support
    "Support: #{@material} structure"
  end
end

# ==== GYERMEK OSZTÁLYOK (IS-A) ====
# "<" = öröklés operátor
class House < Building
  def live_in
    "Making it a cozy home"
  end
end

class Garage < Building
  def park_car
    "Car parked safely"
  end
end

# ==== HASZNÁLAT ====
h = House.new(2500, "concrete", 2)
g = Garage.new(400, "wood")

puts h.structural_support   # => Support: concrete structure
puts h.describe             # => 2500 sqft concrete building, 2 floor(s)
puts g.describe             # => 400 sqft wood building, 1 floor(s)
puts h.live_in               # => Making it a cozy home
puts g.park_car              # => Car parked safely

# Típusellenorzés
puts "h is_a? Building: #{h.is_a?(Building)}"   # => true (IS-A!)
puts "g is_a? House: #{g.is_a?(House)}"         # => false
```{{exec}}

## 3.2 Metódus felülírás + `super`

A gyermekosztály felülírhatja a szülo metódusait, és `super`-rel meghívhatja azt:

```ruby
class House < Building
  attr_accessor :rooms

  def initialize(area, material, floors, rooms)
    super(area, material, floors)  # meghívja Building#initialize-t
    @rooms = rooms
  end

  def describe
    basic = super  # Building#describe eredménye
    "#{basic}, #{@rooms} rooms"
  end
end

h = House.new(2500, "concrete", 2, 4)
puts h.describe
# => "2500 sqft concrete building, 2 floor(s), 4 rooms"
```{{exec}}

## 3.3 Ancestors — Az osok lánca

```ruby
puts House.ancestors
# => [House, Building, Object, Kernel, BasicObject]
```{{exec}}

Ez a **metódus keresési út**! Ruby itt keresi a metódusokat sorban:

1. **House** → 2. **Building** → 3. **Object** → 4. **Kernel** → 5. **BasicObject**

Nézd meg, honnan jönnek a metódusok:

```ruby
h = House.new(2500, "concrete", 2, 4)
puts "describe tulajdonosa: #{h.method(:describe).owner}"
puts "structural_support tulajdonosa: #{h.method(:structural_support).owner}"
```{{exec}}

## Összefoglalás

- `class House < Building` → House **IS-A** Building
- `super` meghívja a szülo verzióját
- `Class.ancestors` kiírja a keresési láncot
- Ruby **egyes öröklodésu** — 1 osztálynak 1 szüloje lehet
- De: **mixinekkel** (következo lecke) megtörheted ezt a korlátot!
