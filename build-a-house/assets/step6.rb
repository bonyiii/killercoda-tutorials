# encoding: utf-8

class Kitchen
  def use_room
    "Készül az ebéd."
  end
end

class Bedroom
  def use_room
    "Békésen alszom."
  end
end

def get_cozy(room)
  puts room.use_room
end
