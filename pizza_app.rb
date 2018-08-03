def size_cost()
	sizes = {
		"small" => 8.00,
		"medium" => 10.00,
		"large" => 12.00, 
	}
end
def veg()
	veggies = ["mushrooms,", "banana_peppers,", "onions,", "tomatoes,"]
end
def meat()
	meats = ["pepperoni,", "sausage,", "ham,", "bacon,"]
end
def pizza(delivery, size, crust, sauce, veggies, meats, cheese)
	if delivery.class != Integer
		delivery = 0
	end
	pizza_cost = size_cost()[size] + delivery
		if crust == "pan"
			pizza_cost += 1
		elsif crust == "stuffed_crust"
			pizza_cost += 2
		else
			pizza_cost = pizza_cost
		end
	unless sauce == "classic"
		pizza_cost += 1
	end	
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
	pizza_cost += veg_cost + meat_cost + cheese.to_i
		if pizza_cost.to_s.split('')[-2] == "."
			pizza_cost = pizza_cost.to_s.split('') + ["0"]
			pizza_cost = pizza_cost.join
		end
	pizza_cost
end