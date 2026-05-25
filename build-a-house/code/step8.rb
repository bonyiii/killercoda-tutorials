module Solarable
  def energy_efficiency
    "Solar: A++"
  end
end

module Insurable
  def energy_efficiency
    "Insurance: requires inspection"
  end
end

class Building
  def energy_efficiency
    "Building: standard"
  end
end

class House < Building
  include Solarable
  include Insurable
end

class House
  def energy_efficiency
    "House: energy star certified"
  end
end
