# 4. Mixinek — Eloregyártott Házfelszerelések

> **HAS-A Kapcsolat:** A háznak VAN napeleme, VAN futesrendszere. Mixinek (modulok) = eloregyártott funkciók, amiket bármely osztály bekábelezhet.

## Kód betöltése IRB-ben

1. Indítsd el az IRB-t: `irb`{{exec}}
2. Töltsd be: `load "/root/code/step4.rb"`
3. Próbáld ki:

```ruby
h = House.new(2500, "concrete")
puts h.generate_power
```

## 4.1 Modul definiálása

Eloször definiáljuk az eloregyártott felszerelést:

```ruby
module SolarPanel
  def generate_power
    "Generating 5kW from solar energy"
  end
end
```{{exec}}

## 4.2 Include — Modul bekábelezése

```ruby
class Building
  attr_accessor :area, :material

  def initialize(area, material)
    @area = area
    @material = material
  end
end

class House < Building
  include SolarPanel
end

h = House.new(2500, "concrete")
puts h.generate_power
# => Generating 5kW from solar energy
```{{exec}}

## 4.3 Include vs Extend

```ruby
module BuildingStats
  def instance_counter
    "This is an instance method"
  end
end

module ClassMethods
  def total_buildings
    "5 buildings registered"
  end
end

class Villa < Building
  include BuildingStats   # -> példánymetódus
  extend ClassMethods      # -> osztálymetódus
end

v = Villa.new(3000, "stone")
puts v.instance_counter      # => "This is an instance method"
puts Villa.total_buildings   # => "5 buildings registered"
puts Villa.ancestors
```{{exec}}

## Összefoglalás

| Eszköz  | Kulcsszó  | Hatás                   |
|---------|-----------|-------------------------|
| Öröklés | `<`       | IS-A kapcsolat          |
| Mixin   | `include` | HAS-A, példánymetódusok |
| Mixin   | `extend`  | HAS-A, osztálymetódusok |

Több modult is include-olhatsz — ez a Ruby elegáns válasza a többszörös öröklésre!
