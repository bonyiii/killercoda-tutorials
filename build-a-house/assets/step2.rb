# encoding: utf-8

class House
  attr_accessor :address, :rooms

  def initialize(address, rooms)
    @address = address
    @rooms = rooms
  end

  def describe
    "House at #{@address} with #{@rooms} rooms"
  end
end
