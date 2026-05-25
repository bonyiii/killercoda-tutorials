# 2. Tervrajzok vs. Valódi Házak

> **Osztály = Tervrajz (Blueprint). Példány = Valódi ház.** Egy tervből végtelen ház építheto.

## Kód betöltése IRB-ben

A lépés osztályai előre el vannak készítve:

1. Indítsd el az IRB-t: `irb`{{exec}}
2. Töltsd be a fájlt: `load "/root/code/step2.rb"`
3. Használd az osztályokat:

```ruby
my_house = House.new("123 Ruby Lane", 4)
puts my_house.describe
```

## 2.1 Osztály definiálása — A tervrajz

Egy `House` osztály létrehozása:

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
```{{exec}}

Minden példány saját `@`-os változókkal rendelkezik — ezek tárolják az egyedi adatokat.

## 2.2 Példányok létrehozása — Házak építése

```ruby
h1 = House.new("123 Ruby St", 3)
h2 = House.new("456 OOP Ave", 5)

puts h1.describe
puts h2.describe

puts "Cím: #{h1.address}"
h1.address = "789 New St"
puts "Új cím: #{h1.address}"
```{{exec}}

## 2.3 Reflektív metódusok — "Bontsd fel a házat"

```ruby
h = House.new("789 Ruby Rd", 4)

puts "Osztály: #{h.class}"
puts "Egyedi azonosító: #{h.object_id}"
puts "Példányváltozók: #{h.instance_variables}"
puts "Van describe metódusa? #{h.respond_to?(:describe)}"
puts "Van fly metódusa? #{h.respond_to?(:fly)}"
```{{exec}}

Nézd meg az összes elérheto metódust:

`ruby -e 'puts House.new("x",1).methods.sort'`{{exec}}

## Gyakorló feladat

Hozz létre egy `Building` osztályt `area` és `material` attribútumokkal!

<details><summary>Megoldás</summary>

```ruby
class Building
  attr_accessor :area, :material
  def initialize(area, material)
    @area = area
    @material = material
  end
  def describe
    "#{@area} sqft, #{@material}"
  end
end
b = Building.new(2000, "concrete")
puts b.describe
```{{exec}}

</details>
