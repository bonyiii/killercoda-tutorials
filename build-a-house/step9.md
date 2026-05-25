# 9. Gyors Referencia — Puska

> Az elmúlt 8 lépés összefoglalása gyorsan használható kódrészletekkel. **Próbáld ki oket!**

## Kódok betöltése

Az egyes lépések osztályai a `code/` mappában találhatók:

| Fájl                     | Tartalom                          |
|--------------------------|-----------------------------------|
| `code/step2.rb`          | `House` osztály                   |
| `code/step3.rb`          | `Building`, `House`, `Garage`     |
| `code/step4.rb`          | `SolarPanel` modul, mixinek       |
| `code/step5.rb`          | `SmartHome` enkapszuláció         |
| `code/step6.rb`          | `Kitchen`, `Bedroom`, polimorfizmus |
| `code/step7.rb`          | Okos eszközök, Duck Typing        |
| `code/step8.rb`          | Metódus keresés, eigenclass       |

Betöltés IRB-ben: `load "/root/code/stepN.rb"` a kívánt lépés számával.

## Osztályok és példányok

```ruby
class House
  attr_accessor :address, :rooms

  def initialize(address, rooms)
    @address = address
    @rooms = rooms
  end

  def describe
    "House at #{@address} with #{@rooms} rooms"
  end
end

my_house = House.new("123 Ruby Lane", 4)
puts my_house.describe
```{{exec}}

## Öröklés (`<`) és super

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

house = House.new(2500, "concrete")
puts house.structural_support
puts "IS-A? #{house.is_a?(Building)}"
```{{exec}}

## Mixinek (include)

```ruby
module SolarPanel
  def generate_power
    "Generating 5kW from solar energy"
  end
end

class House
  include SolarPanel
end

h = House.new
puts h.generate_power
```{{exec}}

## Enkapszuláció

```ruby
class SmartHome
  def house_number
    "14"
  end

  private
  def my_bedroom
    "Authorization required"
  end

  protected
  def shared_bathroom
    "Available for family"
  end
end

home = SmartHome.new
puts "Public: #{home.house_number}"
puts "Send bypass: #{home.send(:my_bedroom)}"
```{{exec}}

## Polimorfizmus

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

get_cozy(Kitchen.new)
get_cozy(Bedroom.new)
```{{exec}}

## Duck Typing

```ruby
def make_sound(animal)
  animal.speak
end

class Duck
  def speak; "Quack"; end
end

class Dog
  def speak; "Woof"; end
end

puts make_sound(Duck.new)
puts make_sound(Dog.new)
```{{exec}}

## Metódus keresés

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
puts "Tulajdonos: #{my_house.method(:energy_efficiency).owner}"
puts House.ancestors
```{{exec}}

## Eigenclass (Singleton)

```ruby
house_a = House.new
def house_a.fire_pole
  "Slides down!"
end
puts house_a.fire_pole

house_b = House.new
# puts house_b.fire_pole  # ERROR!
```{{exec}}

## Legfontosabb parancsok

```ruby
puts 42.class                         # => Integer
puts "abc".respond_to?(:upcase)        # => true
puts "abc".methods.sort                # összes metódus
puts "abc".method(:upcase).owner       # => String
puts House.ancestors                   # keresési lánc
puts House.new(2500,"x").singleton_class.ancestors
```{{exec}}

> **Gratulálok!** Most már ismered a Ruby OOP alapjait. Használd ezt a lapot puskaként a további Ruby programozáshoz! 🏠✨
