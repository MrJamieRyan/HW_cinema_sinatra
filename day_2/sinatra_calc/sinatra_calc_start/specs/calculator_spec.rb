require 'minitest/autorun'
require_relative '../models/calculator'

class TestCalculator < Minitest::Test

  def test_add
    assert_equal( 6, Calculator.add(4, 2) )
  end

  def test_subtract
    assert_equal( 5, Calculator.subtract(10, 5) )
  end

  def test_multiply
    assert_equal( 20, Calculator.multiply(10, 2) ) 
  end

  def test_divide
    assert_equal( 3, Calculator.divide(9, 3) )
  end

end
