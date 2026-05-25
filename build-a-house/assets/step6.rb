# encoding: utf-8

class Kitchen
  def use_room
    "Cooking a delicious meal"
  end
end

class Bedroom
  def use_room
    "Sleeping peacefully"
  end
end

class Bathroom
  def use_room
    "Taking a relaxing bath"
  end
end

class LivingRoom
  def use_room
    "Watching TV"
  end
end

def get_cozy(room)
  puts room.use_room
end

def safe_get_cozy(room)
  if room.respond_to?(:use_room)
    room.use_room
  else
    "This object cannot be used as a room"
  end
end
