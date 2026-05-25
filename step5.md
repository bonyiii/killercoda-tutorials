# 5. Enkapszuláció — Falak és Magánszféra

> **Falak megóvják a magánszobákat.** Ruby hozzáférés-szabályozással: **Public** = nappali (bárki), **Protected** = családi fürdo (osztály + alosztályok), **Private** = háló (csak a tulajdonos).

## 5.1 Három szint — Public / Protected / Private

```ruby
class SmartHome
  # PUBLIC (alapértelmezett) - bárki hívhatja
  def front_door_status
    "Front door is locked"
  end

  def open_front_door(code)
    if code == @secret_code
      unlock_door    # private metódus hívása OSZTÁLYON BELÜL ok
    end
  end

  # PUBLIC -> váltás PRIVATE-ra
  private

  def unlock_door
    "Door unlocked"
  end

  def master_bedroom_access
    "Authorization required"
  end

  # PUBLIC -> váltás PROTECTED-re
  protected

  def shared_bathroom_status
    "Bathroom available for family"
  end

  public

  def guest_wifi_password
    "Guest: house123"
  end
end
```{{exec}}

## 5.2 Mit érsz el kívülrol — és mit nem?

```ruby
home = SmartHome.new

# PUBLIC - OK:
puts "Front door: #{home.front_door_status}"
puts "WiFi: #{home.guest_wifi_password}"

# PRIVATE - HIBA! (csak osztályon belül)
begin
  home.unlock_door
rescue => e
  puts "HIBA private: #{e.message}"
end

# PROTECTED - HIBA! (kívülrol)
begin
  home.shared_bathroom_status
rescue => e
  puts "HIBA protected: #{e.message}"
end

# DE: a send megkerüli a védelmet (csak ne használd élesben!)
puts "Send bypass private: #{home.send(:unlock_door)}"
puts "Send bypass protected: #{home.send(:shared_bathroom_status)}"
```{{exec}}

## 5.3 attr_reader / attr_writer kombinációk

```ruby
class SecureHouse
  # Publikus getter, privát setter
  attr_reader :address
  attr_writer :address

  # Védett adattag
  protected
  attr_accessor :security_level

  # Privát adattag
  private
  attr_accessor :secret_code

  public
  def initialize(address)
    @address = address
    @security_level = "high"
    @secret_code = "1234"
  end
end

sh = SecureHouse.new("789 Ruby Rd")
puts "Address (public reader): #{sh.address}"
# sh.address = "New"   # HIBA! writer private

puts "respond_to? tests:"
puts "  address: #{sh.respond_to?(:address)}"
puts "  security_level: #{sh.respond_to?(:security_level)}"  # false (protected)
puts "  secret_code: #{sh.respond_to?(:secret_code)}"        # false (private)
puts "  send: #{sh.respond_to?(:send)}"                      # true (mindent elérsz!)
```{{exec}}

## Összefoglalás

| Szint       | Hasonlat         | Hívható kívülrol? | Hívható osztályon belül? |
|-------------|------------------|-------------------|--------------------------|
| `public`    | Nappali          | Igen              | Igen                     |
| `protected` | Családi fürdo    | Nem               | Igen (osztály + gyermek) |
| `private`   | Hálószoba        | Nem               | Csak receiver nélkül     |

> **Extra:** `send` mindent megkerül — ezért hívják "metaprogramming" varázslatnak!
