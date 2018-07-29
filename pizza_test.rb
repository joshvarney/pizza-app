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
	assert_equal(8.00, pizza("small", [nil], [nil], 0))
end
def test_that_veg_returns_correct_price
	assert_equal(10.50, pizza("medium", ["onions"], [nil], 0))
end
def test_that_2_veg_returns_correct_price
	assert_equal(13.00, pizza("large", ["mushrooms", "tomatoes"], [nil], 0))
end
def test_that_meat_returns_correct_price
	assert_equal(8.75, pizza("small", [nil], ["ham"], 0))
end
def test_that_2_meats_returns_correct_price
	assert_equal(11.50, pizza("medium", [nil], ["ham", "bacon"], 0))
end
def test_that_meats_and_veggies_work_together
	size = "large"
	veggies = ["mushrooms", "bannana peppers", "onions", "tomatoes"]
	meats = ["pepperoni", "sausage", "ham", "bacon"]
	assert_equal(17.00, pizza(size, veggies, meats, 0))
end
def test_that_can_add_extra_cheese
	size = "large"
	veggies = ["mushrooms", "bannana peppers", "onions", "tomatoes"]
	meats = ["pepperoni", "sausage", "ham", "bacon"]
	cheese = 1
	assert_equal(18.00, pizza(size, veggies, meats, cheese))
end
end