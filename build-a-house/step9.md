# 9. Gyors Referencia — Puska

> Az elmúlt 8 lépés összefoglalása gyorsan használható kódrészletekkel. **Próbáld ki oket!**

## Kódok betöltése

Az egyes lépések osztályai a `code/` mappában találhatók:

| Fájl                     | Tartalom                          |
|--------------------------|-----------------------------------|
| `code/step2.rb`          | `House` osztály                   |
| `code/step3.rb`          | `Building`, `House`, `Garage`     |
| `code/step4.rb`          | `Insurable`, `Solarable`, mixinek |
| `code/step5.rb`          | `SmartHome`, `SecureHouse`        |
| `code/step6.rb`          | `Kitchen`, `Bedroom`, polimorfizmus |
| `code/step7.rb`          | Okos eszközök, Duck Typing        |
| `code/step8.rb`          | Metódus keresési út               |

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
    "#{@address}, #{@rooms} rooms"
  end
end

h = House.new("123 Ruby St", 4)
puts h.describe
puts "Getter: #{h.address}"
h.address = "456 New St"   # setter
puts "Változott: #{h.address}"
```{{exec}}

## Öröklés (`<`) és super

```ruby
class Building
  def initialize(area)
    @area = area
  end
end

class House < Building
  def initialize(area, rooms)
    super(area)   # szülo konstruktor hívása
    @rooms = rooms
  end
end

h = House.new(2500, 4)
puts "IS-A? #{h.is_a?(Building)}"    # => true
puts "Ősök: #{House.ancestors.first(3)}"
```{{exec}}

## Mixinek (include / extend)

```ruby
module Printable
  def print_details
    "#{self.class}: #{respond_to?(:address) ? address : 'N/A'}"
  end
end

class House
  include Printable  # példánymetódus
end

h = House.new("123 Ruby St", 4)
puts h.print_details
```{{exec}}

## Enkapszuláció

```ruby
class Example
  def public_meth; "public"; end

  private
  def private_meth; "private"; end

  protected
  def protected_meth; "protected"; end
end

e = Example.new
puts "Public: #{e.public_meth}"
puts "Send bypass: #{e.send(:private_meth)}"
puts "respond_to? public: #{e.respond_to?(:public_meth)}"
puts "respond_to? private: #{e.respond_to?(:private_meth)}"
```{{exec}}

## Polimorfizmus

```ruby
class Dog
  def speak; "Woof"; end
end

class Cat
  def speak; "Meow"; end
end

[Dog.new, Cat.new].each { |a| puts a.speak }
```{{exec}}

## Duck Typing

```ruby
def make_sound(animal)
  animal.speak  # Nem érdekel, mi az osztálya
end

class Duck
  def speak; "Quack"; end
end

puts make_sound(Duck.new)
puts make_sound(Dog.new)
```{{exec}}

## Metódus keresés

```ruby
module M; def foo; "M"; end; end
class C; include M; end
c = C.new
puts c.foo                    # => "M"
puts c.method(:foo).owner     # => M
puts C.ancestors              # => [C, M, Object, Kernel, BasicObject]
```{{exec}}

## Legfontosabb parancsok

```ruby
# Gyakran használt reflektív metódusok
puts 42.class                         # => Integer
puts "abc".respond_to?(:upcase)        # => true
puts "abc".methods.sort                # összes metódus
puts "abc".method(:upcase).owner       # => String
puts "abc".method(:upcase).source_location  # fájl + sor (ha elérheto)
puts String.ancestors                  # keresési lánc
```{{exec}}

> **Gratulálok!** Most már ismered a Ruby OOP alapjait. Használd ezt a lapot puskaként a további Ruby programozáshoz! 🏠✨
