# encoding: utf-8

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

class Garage < Building
  def park_car
    "Car parked safely"
  end
end
