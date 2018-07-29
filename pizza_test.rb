require "minitest/autorun"
require_relative "pizza_app.rb"
class Test_Pizza_app <Minitest::Test

def test_that_size_hash_returns
	assert_equal(Hash, size_cost().class)
end
def test_that_veg_array_returns
	assert_equal(Array, veg().class)
end
def test_that_meat_array_returns
	assert_equal(Array, meat().class)
end
def test_that_small_is_8_00
	assert_equal(8.00, pizza("small", [nil]))
end
def test_that_veg_returns_correct_price
	assert_equal(10.50, pizza("medium", ["onions"]))
end
def test_that_2_veg_returns_correct_price
	assert_equal(13.00, pizza("large", ["mushrooms", "tomatoes"]))
end
end