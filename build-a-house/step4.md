# 4. Mixinek — Eloregyártott Házfelszerelések

> **HAS-A Kapcsolat:** A háznak VAN futesrendszere, VAN napeleme. Mixinek (modulok) = eloregyártott funkciók, amiket bármely osztály bekábelezhet.

## Kód betöltése IRB-ben

1. Indítsd el az IRB-t: `irb`{{exec}}
2. Töltsd be: `load "/root/code/step4.rb"`
3. Próbáld ki:

```ruby
h = House.new(2500, "concrete", 2, "123 Ruby St")
puts h.insurance_paperwork
puts h.generate_power(6)
puts Villa.total_buildings
```

## 4.1 Modul definiálása

Eloször definiáljuk az eloregyártott felszereléseket:

```ruby
module Insurable
  BASE_RATE = 0.03

  def insurance_paperwork
    "Insurance policy for #{@address || self.class}"
  end
end

module Solarable
  def generate_power(sun_hours)
    "#{sun_hours * 5}kW generated today"
  end

  def energy_rating
    "A++"
  end
end
```{{exec}}

## 4.2 Include — Modul bekábelezése

```ruby
class Building
  attr_accessor :area, :material, :floors, :address
  def initialize(area, material, floors = 1, address = "unknown")
    @area = area
    @material = material
    @floors = floors
    @address = address
  end
end

class House < Building
  include Insurable   # példánymetódusok lesznek belole
  include Solarable
end

h = House.new(2500, "concrete", 2, "123 Ruby St")

puts h.insurance_paperwork
puts h.generate_power(6)
puts h.energy_rating
puts "Konstans: #{Insurable::BASE_RATE}"
```{{exec}}

## 4.3 Include vs Extend

<!--
A különbség: `include` példánymetódusokat ad, `extend` osztálymetódusokat.
-->

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

v = Villa.new(3000, "stone", 2, "1 Luxury Ln")
puts v.instance_counter      # => "This is an instance method"   (include)
puts Villa.total_buildings   # => "5 buildings registered"      (extend)

# Nézd meg az ancestors láncot:
puts "Ancestors: #{Villa.ancestors}"
```{{exec}}

## 4.4 Több modul = Ruby válasza a többszörös öröklésre

```ruby
module A
  def hello; "A says hello"; end
end

module B
  def hello; "B says hello"; end
end

class MyClass
  include A
  include B  # B felülírja A-t a keresési láncban
end

obj = MyClass.new
puts obj.hello                # => "B says hello"
puts MyClass.ancestors        # B megelozi A-t
```{{exec}}

## Összefoglalás

| Eszköz        | Kulcsszó  | Hatás                       |
|---------------|-----------|-----------------------------|
| Öröklés       | `<`       | IS-A kapcsolat              |
| Mixin         | `include` | HAS-A, példánymetódusok     |
| Mixin         | `extend`  | HAS-A, osztálymetódusok     |
| Modul előre   | `prepend` | Modul megelozi az osztályt  |

Több modult is include-olhatsz — ez a Ruby elegáns válasza a többszörös öröklésre!
