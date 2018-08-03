require 'sinatra'
require_relative 'pizza_app.rb'
enable :sessions

get '/' do
	erb :first_page, locals:{pizza_cost: ""}
end
post '/first_page' do
	delivery = params[:delivery]
	delivery1 = params[:delivery1]
		if delivery == "2"
			delivery = 2
			delivery1 = 2
		else 
			delivery = 0
			delivery1 = 0
		end
	name = params[:name]
	address = params[:address]
	zip = params[:zip]
		if zip != "25601"
			delivery = 0
		end	
	phone = params[:phone]
	email = params[:email]
	crust = params[:crust]
	sauce = params[:sauce]
	veg1 = params[:veg1]
	veg2 = params[:veg2]
	veg3 = params[:veg3]
	veg4 = params[:veg4]
	meat1 = params[:meat1]
	meat2 = params[:meat2]
	meat3 = params[:meat3]
	meat4 = params[:meat4]
	size = params[:size]
	cheese = params[:cheese]
		if cheese == nil
			cheese = 0
		end		
	veggies = veg1.to_s.split(' ') + veg2.to_s.split(' ') + veg3.to_s.split(' ') + veg4.to_s.split(' ')
	meats = meat1.to_s.split(' ') + meat2.to_s.split(' ')	+ meat3.to_s.split(' ') + meat4.to_s.split(' ')
	session[:delivery] = delivery
	session[:delivery1] = delivery1
	session[:name] = name
	session[:address] = address
	session[:zip] = zip
	session[:phone] = phone
	session[:email] = email
	session[:crust] = crust
	session[:sauce] = sauce
	session[:size] = size
	session[:veggies] = veggies
	session[:meats] = meats
	session[:cheese] = cheese
	session[:pizza_cost] = pizza(delivery, size, crust, sauce, veggies, meats, cheese)
	erb :first_page, locals:{pizza_cost: session[:pizza_cost], delivery: session[:delivery], delivery1: session[:delivery1], name: session[:name], address: session[:address], zip: session[:zip], phone: session[:phone], email: session[:email], crust: session[:crust], sauce: session[:sauce], size: session[:size], veggies: session[:veggies], meats: session[:meats], cheese: session[:cheese]}
	redirect '/confirmation_page'
end
get '/confirmation_page' do
	erb :confirmation_page, locals:{pizza_cost: session[:pizza_cost], delivery: session[:delivery], delivery1: session[:delivery1], name: session[:name], address: session[:address], zip: session[:zip], phone: session[:phone], email: session[:email], crust: session[:crust], sauce: session[:sauce], size: session[:size], veggies: session[:veggies], meats: session[:meats], cheese: session[:cheese]}
end
post '/confirmation_page' do
	more_pizza = params[:more_pizza]
	order_number = params[:order_number]
	total_cost = params[:total_cost]
	pizza_cost = pizza_cost.to_f
	total_cost = total_cost.to_f
	more_pizza = more_pizza.to_i
	total_cost += pizza_cost
	session[:total_cost] = total_cost
	session[:order_number] = order_number
	session[:more_pizza] = more_pizza
	erb :confirmation_page, locals:{total_cost: session[:total_cost], order_number: session[:order_number], more_pizza: session[:more_pizza], pizza_cost: session[:pizza_cost], delivery: session[:delivery], delivery1: session[:delivery1], name: session[:name], address: session[:address], zip: session[:zip], phone: session[:phone], email: session[:email], crust: session[:crust], sauce: session[:sauce], size: session[:size], veggies: session[:veggies], meats: session[:meats], cheese: session[:cheese]}
		if more_pizza == 1
			redirect '/more_pizza_page'
		else 
			redirect '/final_page'
		end	
end
get '/more_pizza_page' do
	erb :more_pizza_page, locals:{total_cost: session[:total_cost], order_number: session[:order_number], more_pizza: session[:more_pizza], pizza_cost: session[:pizza_cost], delivery: session[:delivery], delivery1: session[:delivery1], name: session[:name], address: session[:address], zip: session[:zip], phone: session[:phone], email: session[:email], crust: session[:crust], sauce: session[:sauce], size: session[:size], veggies: session[:veggies], meats: session[:meats], cheese: session[:cheese]}
end
post '/more_pizza_page' do
p session
	delivery = 0
	delivery = params[:delivery]
	crust = params[:crust]
	sauce = params[:sauce]
	veg1 = params[:veg1]
	veg2 = params[:veg2]
	veg3 = params[:veg3]
	veg4 = params[:veg4]
	meat1 = params[:meat1]
	meat2 = params[:meat2]
	meat3 = params[:meat3]
	meat4 = params[:meat4]
	size = params[:size]
	cheese = params[:cheese]
		if cheese == nil
			cheese = 0
		end		
	veggies = veg1.to_s.split(' ') + veg2.to_s.split(' ') + veg3.to_s.split(' ') + veg4.to_s.split(' ')
	meats = meat1.to_s.split(' ') + meat2.to_s.split(' ')	+ meat3.to_s.split(' ') + meat4.to_s.split(' ')
	session[:crust] = crust
	session[:sauce] = sauce
	session[:size] = size
	session[:veggies] = veggies
	session[:meats] = meats
	session[:cheese] = cheese
	session[:pizza_cost] = pizza(delivery, size, crust, sauce, veggies, meats, cheese)
	session[:total_cost] = total_cost + pizza_cost
	session[:order_number] = order_number
	session[:more_pizza] = more_pizza
	p session
	erb :more_pizza_page, locals:{total_cost: session[:total_cost], order_number: session[:order_number], more_pizza: session[:more_pizza], pizza_cost: session[:pizza_cost], delivery: session[:delivery], delivery1: session[:delivery1], name: session[:name], address: session[:address], zip: session[:zip], phone: session[:phone], email: session[:email], crust: session[:crust], sauce: session[:sauce], size: session[:size], veggies: session[:veggies], meats: session[:meats], cheese: session[:cheese]}
	redirect '/confirmation_page'
end
get '/final_page' do
	
	erb :final_page, locals:{total_cost: session[:total_cost], order_number: session[:order_number], more_pizza: session[:more_pizza], pizza_cost: session[:pizza_cost], delivery: session[:delivery], delivery1: session[:delivery1], name: session[:name], address: session[:address], zip: session[:zip], phone: session[:phone], email: session[:email], crust: session[:crust], sauce: session[:sauce], size: session[:size], veggies: session[:veggies], meats: session[:meats], cheese: session[:cheese]}
end