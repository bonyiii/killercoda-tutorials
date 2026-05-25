# encoding: utf-8

module SolarHeating
  def energy_efficiency
    "100% renewable"
  end
end

class Building
  def energy_efficiency
    "30% renewable"
  end
end

class House < Building
  include SolarHeating
end
