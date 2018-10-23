class BusStop

  attr_reader :name, :queue

  def initialize(name)
    @name = name
    @queue = []
  end

  def add_to_queue(person)
    @queue << person
  end

  def empty_queue
    @queue.clear
  end

end
