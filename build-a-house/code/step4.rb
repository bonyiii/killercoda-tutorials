module Insurable
  BASE_RATE = 0.03

  def insurance_paperwork
    "Insurance policy for #{@address || self.class}"
  end
end

module Solarable
  def generate_power(sun_hours)
    "#{sun_hours * 5}kW generated today"
  end

  def energy_rating
    "A++"
  end
end

class Building
  attr_accessor :area, :material, :floors, :address

  def initialize(area, material, floors = 1, address = "unknown")
    @area = area
    @material = material
    @floors = floors
    @address = address
  end
end

class House < Building
  include Insurable
  include Solarable
end

module BuildingStats
  def instance_counter
    "This is an instance method"
  end
end

module ClassMethods
  def total_buildings
    "5 buildings registered"
  end
end

class Villa < Building
  include BuildingStats
  extend ClassMethods
end

module A
  def hello; "A says hello"; end
end

module B
  def hello; "B says hello"; end
end

class MyClass
  include A
  include B
end
