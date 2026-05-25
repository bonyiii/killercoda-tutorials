# 7. Duck Typing — Viselkedés Középpontban

> **"Ha kacsaként jár, kacsaként hápog — akkor kacsának hívjuk."** Bármi, ami Wi-Fi-re csatlakozik + hangra reagál = okos eszköz. Nem kell `OkosEszkoz` osztály!

## 7.1 Duck Typing — Okos otthon példa

```ruby
class SmartLight
  def connect
    "Light: WiFi connected"
  end

  def execute(cmd)
    "Light: #{cmd}"
  end
end

class SmartThermostat
  def connect
    "Thermostat: WiFi connected"
  end

  def execute(cmd)
    "Thermostat: #{cmd}"
  end
end

class SmartLock
  def connect
    "Lock: WiFi connected"
  end

  def execute(cmd)
    "Lock: #{cmd}"
  end
end

# EGY függvény MINDEN okos eszközhöz
def control_smart_device(device)
  puts device.connect
  result = device.execute("turn_on")
  puts "Result: #{result}"
end

control_smart_device(SmartLight.new)
puts "---"
control_smart_device(SmartThermostat.new)
puts "---"
control_smart_device(SmartLock.new)
```{{exec}}

## 7.2 Duck Typing vs. Típusellenorzés

A rossz (Java-stílusú) vs. jó (Ruby-stílusú) megközelítés:

```ruby
# ROSSZ: típusellenorzés
def control_bad(device)
  if device.is_a?(SmartLight) || device.is_a?(SmartThermostat)
    device.connect
  else
    raise "Unknown device type: #{device.class}"
  end
end

# JÓ: Duck Typing — csak hívd!
def control_good(device)
  device.connect  # Ha nem tudja, kivételt dob
end

# BIZTONSÁGOS: respond_to? ellenorzés
def control_safe(device)
  unless device.respond_to?(:connect)
    raise "Device must implement connect()"
  end
  device.connect
end

# Még egy dinamikusan létrehozott objektum is muködik:
makeshift = Object.new
def makeshift.connect
  "Makeshift: connected"
end
def makeshift.execute(cmd)
  "Makeshift: #{cmd}"
end

control_smart_device(makeshift)
```{{exec}}

## 7.3 Duck Typing teszteléshez

```ruby
class MockSmartDevice
  attr_reader :commands

  def initialize
    @commands = []
  end

  def connect
    @connected = true
  end

  def execute(cmd)
    @commands << cmd
    "mocked: #{cmd}"
  end
end

mock = MockSmartDevice.new
control_smart_device(mock)
puts "Parancsok: #{mock.commands.inspect}"
```{{exec}}

## Gyakorló feladat

Készíts egy `SmartSpeaker` osztályt, ami tud `connect`-et és `execute`-ot, majd próbáld ki `control_smart_device`-vel!

<details><summary>Megoldás</summary>

```ruby
class SmartSpeaker
  def connect
    "Speaker: WiFi connected"
  end

  def execute(cmd)
    "Speaker playing: #{cmd}"
  end
end

control_smart_device(SmartSpeaker.new)
```{{exec}}

</details>

> **Lényeg:** A Ruby-t nem érdekli az objektum osztálya — csak az, hogy reagál-e a hívott metódusokra. **IF IT QUACKS LIKE A DUCK...**
