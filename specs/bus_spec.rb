require('minitest/autorun')
require('minitest/rg')
require_relative('../bus')
require_relative('../person')
require_relative('../bus_stop')

class BusTest < MiniTest::Test

def setup
  @person_1 = Person.new("Borna", "33")
  @person_2 = Person.new("Kevin", "45")
  @person_3 = Person.new("Borvin", "78")
  @bus_1 = Bus.new("35", "Airport")
  @bus_stop = BusStop.new("Airport")
  @bus_stop.add_to_queue(@person_1)
  @bus_stop.add_to_queue(@person_2)
end

def test_does_bus_have_route_number

  expected = "35"
  actual = @bus_1.route_number
  assert_equal(expected, actual)
end

def test_does_bus_have_destination
  expected = "Airport"
  actual = @bus_1.destination
  assert_equal(expected, actual)
end

def test_does_bus_drive
  expected = "brum brum"
  actual = @bus_1.drive
  assert_equal(expected, actual)
end

def test_does_bus_have_passengers
  expected = []
  actual = @bus_1.passengers
  assert_equal(expected, actual)
end

def test_count_passengers
  expected = 0
  actual = @bus_1.count_passengers
  assert_equal(expected, actual)
end

def test_add_passenger
  @bus_1.pick_up_passenger(@person_1)
  expected = [@person_1]
  actual = @bus_1.passengers
  assert_equal(expected, actual)
  assert_equal(1, @bus_1.count_passengers)
end

def test_remove_passenger
  @bus_1.pick_up_passenger(@person_1)
  @bus_1.pick_up_passenger(@person_2)
  @bus_1.drop_off_passenger(@person_1)
  expected = [@person_2]
  actual = @bus_1.passengers
  assert_equal(expected, actual)
end

def test_remove_all_passengers
  @bus_1.pick_up_passenger(@person_1)
  @bus_1.pick_up_passenger(@person_2)
  @bus_1.drop_off_all()
  expected = 0
  actual = @bus_1.count_passengers
  assert_equal(expected, actual)
end

def test_board_passengers
  @bus_1.board_all(@bus_stop)
  expected = [@person_1, @person_2]
  actual = @bus_1.passengers
  assert_equal(expected, actual)
  assert_equal(0, @bus_stop.queue.length)
end

end
