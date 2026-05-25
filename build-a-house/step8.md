# 8. Metódus Keresési Út — Az Áramkör Követése

> Hogyan találja meg a Ruby egy metódust? Kövesd a ház rétegeit! Keresési sorrend: objektum → osztály → modulok → ososztály → ... → BasicObject.

## Kód betöltése IRB-ben

1. Indítsd el az IRB-t: `irb`{{exec}}
2. Töltsd be: `load "/root/code/step8.rb"`
3. Próbáld ki:

```ruby
my_house = House.new
puts my_house.energy_efficiency
puts House.ancestors
puts my_house.method(:energy_efficiency).owner
```

## 8.1 Az Ancestors lánc

Nézzük meg a teljes utat:

```ruby
module SolarHeating
  def energy_efficiency
    "100% renewable"
  end
end

class Building
  def energy_efficiency
    "30% renewable"
  end
end

class House < Building
  include SolarHeating
end

my_house = House.new
puts my_house.energy_efficiency
# => 100% renewable (SolarHeating elso a láncban)

puts "Ancestors: #{House.ancestors}"
# => [House, SolarHeating, Building, Object, Kernel, BasicObject]
```{{exec}}

**Az elso metódus, ami a láncban megtalálható, fog válaszolni.**

## 8.2 Singleton metódusok (Eigenclass)

Minden Ruby objektumnak van egy rejtett, saját osztálya — az **eigenclass**. Egyedi metódusokat készíthetsz, amik csak abban az egy objektumban léteznek.

```ruby
house_a = House.new

def house_a.fire_pole
  "Slides down!"
end

puts house_a.fire_pole     # => Slides down!

house_b = House.new
# puts house_b.fire_pole   # ERROR! Csak house_a-n létezik
```{{exec}}

Az eigenclass a keresési lánc legelső helyén áll:

```ruby
puts house_a.singleton_class.ancestors.first(3)
```{{exec}}

## 8.3 A teljes keresési sorrend

```
1. Singleton osztály (eigenclass) — egyedi metódusok
2. Objektum osztálya (House)
3. Include-olt modulok (SolarHeating)
4. Ososztály (Building)
5. Object
6. Kernel (include-olva Object által)
7. BasicObject
```

## Metódusok tulajdonosának ellenőrzése

```ruby
my_house = House.new
puts "energy_efficiency tulajdonosa: #{my_house.method(:energy_efficiency).owner}"
```{{exec}}

> **Extra:** `prepend` — modul beékelése AZ OSZTÁLY ELÉ: `class House; prepend SolarHeating; end` → SolarHeating m megelozi House-t!
