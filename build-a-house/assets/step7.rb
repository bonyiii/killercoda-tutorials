# encoding: utf-8

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

class SmartSpeaker
  def connect
    "Speaker: WiFi connected"
  end

  def execute(cmd)
    "Speaker playing: #{cmd}"
  end
end

def control_smart_device(device)
  puts device.connect
  result = device.execute("turn_on")
  puts "Result: #{result}"
end
