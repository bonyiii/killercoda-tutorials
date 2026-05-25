# encoding: utf-8

class House
  attr_accessor :address, :rooms, :color

  def initialize(address, rooms, color)
    @address = address
    @rooms   = rooms
    @color   = color
    puts "A ház épült: #{@address}"
  end

  def describe
    "#{@color} house at #{@address} with #{@rooms} rooms"
  end

  def paint(new_color)
    @color = new_color
    "House repainted to #{@color}"
  end
end
