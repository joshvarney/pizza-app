def size_cost()
	sizes = {
		"small" => 8.00,
		"medium" => 10.00,
		"large" => 12.00, 
	}
end
def veg()
	veggies = ["mushrooms", "bannana peppers", "onions", "tomatoes"]
end
def meat()
	meats = ["pepperoni", "sausage", "ham", "bacon"]
end
def pizza(size, veggies, meats, cheese)
	pizza_cost = size_cost()[size]
	veg_count = 0
	veggies.each { |x| veg().each { |y|
				if x == y
					veg_count += 1
				end
					}
	}
	veg_cost = 0.50 * veg_count
	meat_count = 0
	meats.each { |x| meat().each { |y|
				if x == y
					meat_count += 1
				end
					}
	}
	meat_cost = 0.75 * meat_count
	pizza_cost += veg_cost + meat_cost + cheese				
end