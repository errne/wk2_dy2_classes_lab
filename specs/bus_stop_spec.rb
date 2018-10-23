require('minitest/autorun')
require('minitest/rg')
require_relative('../bus_stop')
require_relative('../person')

class BusStopTest < MiniTest::Test

  def test_bus_stop_has_name
    bus_stop_1 = BusStop.new("Airport")
    expected = "Airport"
    actual = bus_stop_1.name
    assert_equal(expected, actual)
  end

  def test_bus_has_queue
    bus_stop_1 = BusStop.new("Airport")
    expected = []
    actual = bus_stop_1.queue
    assert_equal(expected, actual)
  end

  def test_add_person_to_queue
    person_1 = Person.new("Kevin", "45")
    bus_stop_1 = BusStop.new("Airport")
    bus_stop_1.add_to_queue(person_1)
    expected = [person_1]
    actual = bus_stop_1.queue
    assert_equal(expected, actual)
  end

  def test_remove_all_from_queue
    person_1 = Person.new("Kevin", "45")
    bus_stop_1 = BusStop.new("Airport")
    bus_stop_1.add_to_queue(person_1)
    bus_stop_1.empty_queue
    expected = 0
    actual = bus_stop_1.queue.length
    assert_equal(expected, actual)
  end

end
