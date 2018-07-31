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
	pizza_cost += veg_cost + meat_cost + cheese.to_i
		if pizza_cost.to_s.split('')[-2] == "."
			pizza_cost = pizza_cost.to_s.split('') + ["0"]
			pizza_cost = pizza_cost.join
		end
		if cheese == 0
			cheese = "regular cheese"
		else 
			cheese = "extra cheese"
		end
	pizza_cost
	toppings = veggies + meats
		if toppings.count >= 1
			toppings = toppings.join(" ").chop.gsub(/[_]/, ' ')
			pizza_cost	= "You got a #{size} with #{toppings} and #{cheese} for #{pizza_cost}"
		else
			pizza_cost = "You got a plain #{size} pizza with #{cheese} for $#{pizza_cost}"				
		end
end