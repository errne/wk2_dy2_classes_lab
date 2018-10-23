require('minitest/autorun')
require('minitest/rg')
require_relative('../person')

class PersonTest < MiniTest::Test



  def test_does_person_have_name
    person_1 = Person.new("Borna", "35")
    expected = "Borna"
    actual = person_1.name
    assert_equal(expected, actual)
  end

  def test_does_person_have_age
    person_1 = Person.new("Kevin", "45")
    expected = "45"
    actual = person_1.age
    assert_equal(expected, actual)
  end

end
