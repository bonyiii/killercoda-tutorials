# 8. Metódus Keresési Út — Az Áramkör Követése

> Hogyan találja meg a Ruby egy metódust? Kövesd az elektromos vezetékeket! Keresési sorrend: objektum → osztály → modulok → ososztály → ... → BasicObject.

## Kód betöltése IRB-ben

1. Indítsd el az IRB-t: `irb`{{exec}}
2. Töltsd be: `load "/root/code/step8.rb"`
3. Próbáld ki:

```ruby
h = House.new(2500, "concrete", 2)
puts h.energy_efficiency
puts House.ancestors
puts h.method(:energy_efficiency).owner
```

## 8.1 Az Ancestors lánc

Nézzük meg a teljes utat:

```ruby
module Solarable
  def energy_efficiency
    "Solar: A++"
  end
end

module Insurable
  def energy_efficiency
    "Insurance: requires inspection"
  end
end

class Building
  def energy_efficiency
    "Building: standard"
  end
end

class House < Building
  include Solarable
  include Insurable  # Ez feljebb kerül az ancestors láncban!
end

# ==== A TELJES LÁNC: ====
puts "Ancestors: #{House.ancestors}"
# => [House, Insurable, Solarable, Building, Object, Kernel, BasicObject]
```{{exec}}

**A keresés balról jobbra halad!** Eloször a `House`-t nézi, aztán `Insurable`-t, aztán `Solarable`-t...

## 8.2 Metódus keresés gyakorlatban

```ruby
h = House.new(2500, "concrete", 2)

# Melyik energy_efficiency fut le?
puts h.energy_efficiency
# => "Insurance: requires inspection"
# (Insurable-ben találta meg eloször)

# Ellenorzés: honnan jön a metódus?
puts "Tulajdonos: #{h.method(:energy_efficiency).owner}"
# => Insurable

# Metódus felülírás a láncban:
class House < Building
  include Solarable
  include Insurable

  def energy_efficiency
    "House: energy star certified"
  end
end

h2 = House.new(2500, "concrete", 2)
puts h2.energy_efficiency   # => "House: energy star certified"
puts "Tulajdonos: #{h2.method(:energy_efficiency).owner}"  # => House
```{{exec}}

## 8.3 Singleton metódusok — Egyedi kábelezés

Csak EGY adott objektum kap egy metódust:

```ruby
special_house = House.new(5000, "stone", 3)

def special_house.has_pool
  "This house has a pool!"
end

# Csak ez az egy ház tud úszni:
puts special_house.has_pool    # => "This house has a pool!"
# puts h2.has_pool             # => NoMethodError!

# A singleton osztály a keresési lánc LEGELSÉJE:
puts "Singleton ancestors: #{special_house.singleton_class.ancestors}"
```{{exec}}

## 8.4 A teljes keresési sorrend

```ruby
class House < Building
  include Solarable
  include Insurable

  def energy_efficiency
    "House: standard"
  end
end

h = House.new(2500, "concrete", 2)

# Singleton metódus hozzáadása
def h.energy_efficiency
  "House (special): super efficient"
end

puts h.energy_efficiency
puts "Tulajdonos: #{h.method(:energy_efficiency).owner}"
```{{exec}}

## Keresési sorrend összefoglaló

```
1. Singleton osztály (special_house egyedi metódusai)
2. Objektum osztálya (House)
3. Include-olt modulok (fordított sorrend: Insurable, Solarable)
4. Ososztály (Building)
5. Object
6. Kernel (include-olva Object által)
7. BasicObject
```

> **Extra:** `prepend` — modul beékelése AZ OSZTÁLY ELÉ: `class House; prepend Insurable; end` → Insurable megelozi House-t!
