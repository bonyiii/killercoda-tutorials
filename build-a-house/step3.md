# 3. Öröklodés — A Tervrajz Újrafelhasználása

> **IS-A Kapcsolat:** Ház IS-A Épulet, Garázs IS-A Épulet. A közös kód a szüloben (`Building`), az egyedi a gyermekekben.

## Kód betöltése IRB-ben

1. Indítsd el az IRB-t: `irb`{{exec}}
2. Töltsd be: `load "/root/code/step3.rb"`
3. Próbáld ki:

```ruby
house = House.new(2500, "concrete")
puts house.structural_support
garage = Garage.new(400, "wood")
puts garage.park_car
puts House.ancestors
```

## 3.1 Alap öröklodés — Építmények hierarchiája

A `Building` osztály tárolja a közös tulajdonságokat. Ruby-ban egy osztálynak csak egy közvetlen ose lehet.

```ruby
class Building
  attr_accessor :area, :material

  def initialize(area, material)
    @area = area
    @material = material
  end

  def structural_support
    "Providing support with #{@material} structure"
  end
end

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

house = House.new(2500, "concrete")
puts house.structural_support
# => Providing support with concrete structure

puts "house is_a? Building: #{house.is_a?(Building)}"
```{{exec}}

## 3.2 Metódus felülírás + `super`

A gyermekosztály felülírhatja a szülo metódusait, és `super`-rel meghívhatja azt:

```ruby
class House < Building
  attr_accessor :rooms

  def initialize(area, material, rooms)
    super(area, material)
    @rooms = rooms
  end

  def describe
    "#{@area} sqft #{@material} house, #{@rooms} rooms"
  end
end

h = House.new(2500, "concrete", 4)
puts h.describe
```{{exec}}

## 3.3 Ancestors — Az osok lánca

```ruby
puts House.ancestors
# => [House, Building, Object, Kernel, BasicObject]
```{{exec}}

Ez a **metódus keresési út**: Ruby itt keresi a metódusokat sorban.

1. **House** → 2. **Building** → 3. **Object** → 4. **Kernel** → 5. **BasicObject**

## Összefoglalás

- `class House < Building` → House **IS-A** Building
- `super` meghívja a szülo verzióját
- `Class.ancestors` kiírja a keresési láncot
- Ruby **egyes öröklodésu** — 1 osztálynak 1 szüloje lehet
- De: **mixinekkel** (következo lecke) megtörheted ezt a korlátot!
