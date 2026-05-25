# 2. Tervrajzok vs. Valódi Házak

> **Osztály = Tervrajz (Blueprint). Példány = Valódi ház.** Egy tervből végtelen ház építheto.

## Kód betöltése IRB-ben

A lépés osztályai előre el vannak készítve:

1. Indítsd el az IRB-t: `irb`{{exec}}
2. Töltsd be a fájlt: `load "code/step2.rb"`
3. Használd az osztályokat:

```ruby
h = House.new("123 Ruby St", 3, "white")
puts h.describe
h.paint("blue")
puts h.describe
```

## 2.1 Osztály definiálása — A tervrajz

Egy `House` osztály létrehozása:

```ruby
class House
  # attr_accessor automatikusan getter/setter-t generál
  attr_accessor :address, :rooms, :color

  # initialize = az építocsapat (konstruktor)
  # Meghívódik, amikor House.new-t hívsz
  def initialize(address, rooms, color)
    @address = address   # @ = példányváltozó (= a ház hátizsákja)
    @rooms   = rooms
    @color   = color
    puts "A ház épült: #{@address}"
  end

  # Példánymetódusok (= a ház képességei)
  def describe
    "#{@color} house at #{@address} with #{@rooms} rooms"
  end

  def paint(new_color)
    @color = new_color
    "House repainted to #{@color}"
  end
end
```{{exec}}

## 2.2 Példányok létrehozása — Házak építése

```ruby
# House.new meghívja az initialize-t
h1 = House.new("123 Ruby St", 3, "white")
h2 = House.new("456 OOP Ave", 5, "brick")

# Minden háznak saját adatai vannak
puts h1.describe
puts h2.describe
```{{exec}}

Egymástól függetlenek:

```ruby
h1.paint("blue")
puts h1.describe  # => "blue house at 123 Ruby St with 3 rooms"
puts h2.describe  # => "brick house at 456 OOP Ave with 5 rooms" (változatlan!)
```{{exec}}

## 2.3 Reflektív metódusok — "Bontsd fel a házat"

```ruby
h = House.new("789 Ruby Rd", 4, "red")

puts "Osztály: #{h.class}"
puts "Egyedi azonosító: #{h.object_id}"
puts "Példányváltozók: #{h.instance_variables}"

# Van-e adott metódusa?
puts "Van paint metódusa? #{h.respond_to?(:paint)}"
puts "Van fly metódusa? #{h.respond_to?(:fly)}"
```{{exec}}

Nézd meg az összes elérheto metódust:

`ruby -e 'puts House.new("x",1,"x").methods.sort'`{{exec}}

## Gyakorló feladat

Hozz létre egy `Building` osztályt `area` és `material` attribútumokkal!
Tipp:

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
