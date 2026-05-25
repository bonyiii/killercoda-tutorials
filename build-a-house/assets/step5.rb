# encoding: utf-8

class SmartHome
  def front_door_status
    "Front door is locked"
  end

  def open_front_door(code)
    if code == @secret_code
      unlock_door
    end
  end

  private

  def unlock_door
    "Door unlocked"
  end

  def master_bedroom_access
    "Authorization required"
  end

  protected

  def shared_bathroom_status
    "Bathroom available for family"
  end

  public

  def guest_wifi_password
    "Guest: house123"
  end
end

class SecureHouse
  attr_reader :address
  attr_writer :address

  protected
  attr_accessor :security_level

  private
  attr_accessor :secret_code

  public
  def initialize(address)
    @address = address
    @security_level = "high"
    @secret_code = "1234"
  end
end
