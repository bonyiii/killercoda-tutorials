# encoding: utf-8

module SolarPanel
  def generate_power
    "Generating 5kW from solar energy"
  end
end

class Building
  attr_accessor :area, :material

  def initialize(area, material)
    @area = area
    @material = material
  end
end

class House < Building
  include SolarPanel
end
