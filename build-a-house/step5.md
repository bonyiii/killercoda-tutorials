# 5. Enkapszuláció — Falak és Magánszféra

> **Falak megóvják a magánszobákat.** Ruby hozzáférés-szabályozással: **Public** = házszám (bárki), **Protected** = fürdoszoba (osztály + alosztályok), **Private** = hálószoba (csak a belső rendszerek).

## Kód betöltése IRB-ben

1. Indítsd el az IRB-t: `irb`{{exec}}
2. Töltsd be: `load "/root/code/step5.rb"`
3. Próbáld ki:

```ruby
home = SmartHome.new
puts home.house_number
```

## 5.1 Három szint — Public / Protected / Private

```ruby
class SmartHome
  # PUBLIC (alapértelmezett) - bárki hívhatja
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
```{{exec}}

## 5.2 Mit érsz el kívülrol — és mit nem?

```ruby
home = SmartHome.new

# PUBLIC - OK:
puts "Házszám: #{home.house_number}"

# PRIVATE - HIBA! (csak osztályon belül)
begin
  home.my_bedroom
rescue => e
  puts "HIBA private: #{e.message}"
end

# PROTECTED - HIBA! (kívülrol)
begin
  home.shared_bathroom
rescue => e
  puts "HIBA protected: #{e.message}"
end

# DE: a send megkerüli a védelmet
puts "Send bypass private: #{home.send(:my_bedroom)}"
```{{exec}}

## Összefoglalás

| Szint       | Hasonlat      | Hívható kívülrol? | Hívható osztályon belül? |
|-------------|---------------|-------------------|--------------------------|
| `public`    | Házszám       | Igen              | Igen                     |
| `protected` | Fürdoszoba    | Nem               | Igen (osztály + gyermek) |
| `private`   | Hálószoba     | Nem               | Csak receiver nélkül     |

> **Extra:** `send` mindent megkerül — ezért hívják "metaprogramming" varázslatnak!
