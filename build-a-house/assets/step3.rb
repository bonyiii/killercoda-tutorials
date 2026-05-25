# encoding: utf-8

class Building
  attr_accessor :area, :material, :floors

  def initialize(area, material, floors = 1)
    @area = area
    @material = material
    @floors = floors
  end

  def describe
    "#{@area} sqft #{@material} building, #{@floors} floor(s)"
  end

  def structural_support
    "Support: #{@material} structure"
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
