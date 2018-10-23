class Bus

  attr_reader :route_number, :destination, :passengers

  def initialize(route_number, destination)
    @route_number = route_number
    @destination = destination
    @passengers = []
  end

  def drive()
    return "brum brum"
  end

  def count_passengers()
    return @passengers.count
  end

  def pick_up(passenger)
    @passengers << passenger
  end

  def drop_off_passenger(passenger)
    @passengers.delete(passenger)
  end

  def drop_off_all()
    @passengers.clear
  end

def board_all(bus_stop)
  for person in bus_stop.queue
    @passengers << person
  end
  bus_stop.empty_queue
end

end
