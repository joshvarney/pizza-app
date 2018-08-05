require 'sinatra'
require_relative 'pizza_app.rb'
enable :sessions

get '/' do
	erb :first_page
end
post '/first_page' do
	order_number = ('100'..'400').to_a
	order_number = order_number.sample(order_number.count)[0]	
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
	total_cost = params[:total_cost]
	more_pizza = params[:more_pizza]		
	veggies = veg1.to_s.split(' ') + veg2.to_s.split(' ') + veg3.to_s.split(' ') + veg4.to_s.split(' ')
	meats = meat1.to_s.split(' ') + meat2.to_s.split(' ')	+ meat3.to_s.split(' ') + meat4.to_s.split(' ')
	session[:order_number] = order_number
	session[:total_cost] = total_cost
	session[:more_pizza] = more_pizza
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
	erb :first_page, locals:{pizza_cost: session[:pizza_cost], delivery: session[:delivery], delivery1: session[:delivery1], name: session[:name], address: session[:address], zip: session[:zip], phone: session[:phone], email: session[:email], crust: session[:crust], sauce: session[:sauce], size: session[:size], veggies: session[:veggies], meats: session[:meats], cheese: session[:cheese], total_cost: session[:total_cost], more_pizza: session[:more_pizza], order_number: session[:order_number]}
	redirect '/confirmation_page'
end
get '/confirmation_page' do	
	erb :confirmation_page, locals:{pizza_cost: session[:pizza_cost], delivery: session[:delivery], delivery1: session[:delivery1], name: session[:name], address: session[:address], zip: session[:zip], phone: session[:phone], email: session[:email], crust: session[:crust], sauce: session[:sauce], size: session[:size], veggies: session[:veggies], meats: session[:meats], cheese: session[:cheese], total_cost: session[:total_cost], more_pizza: session[:more_pizza], order_number: session[:order_number]}
end
post '/confirmation_page' do
	page = params[:page]
	pizza_cost = params[:pizza_cost]
	more_pizza1 = params[:more_pizza1]
	session[:total_cost] = session[:total_cost].to_f + pizza_cost.to_f
	session[:more_pizza] = session[:more_pizza].to_i + more_pizza1.to_i
	erb :confirmation_page, locals:{pizza_cost: session[:pizza_cost], delivery: session[:delivery], delivery1: session[:delivery1], name: session[:name], address: session[:address], zip: session[:zip], phone: session[:phone], email: session[:email], crust: session[:crust], sauce: session[:sauce], size: session[:size], veggies: session[:veggies], meats: session[:meats], cheese: session[:cheese], total_cost: session[:total_cost], more_pizza: session[:more_pizza], order_number: session[:order_number]}
		if page == "1"
			redirect '/more_pizza_page'
		else 
			if session[:total_cost].to_s.split('')[-2] == "."
				session[:total_cost] = session[:total_cost].to_s.split('') + ["0"]
				session[:total_cost] = session[:total_cost].join
			end
			redirect '/final_page'
		end	
end
get '/more_pizza_page' do
	erb :more_pizza_page, locals:{pizza_cost: session[:pizza_cost], delivery: session[:delivery], delivery1: session[:delivery1], name: session[:name], address: session[:address], zip: session[:zip], phone: session[:phone], email: session[:email], crust: session[:crust], sauce: session[:sauce], size: session[:size], veggies: session[:veggies], meats: session[:meats], cheese: session[:cheese], total_cost: session[:total_cost], more_pizza: session[:more_pizza], order_number: session[:order_number]}
end
post '/more_pizza_page' do
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
	erb :more_pizza_page, locals:{pizza_cost: session[:pizza_cost], delivery: session[:delivery], delivery1: session[:delivery1], name: session[:name], address: session[:address], zip: session[:zip], phone: session[:phone], email: session[:email], crust: session[:crust], sauce: session[:sauce], size: session[:size], veggies: session[:veggies], meats: session[:meats], cheese: session[:cheese], total_cost: session[:total_cost], more_pizza: session[:more_pizza], order_number: session[:order_number]}
	redirect '/confirmation_page'
end
get '/final_page' do
	erb :final_page, locals:{pizza_cost: session[:pizza_cost], delivery: session[:delivery], delivery1: session[:delivery1], name: session[:name], address: session[:address], zip: session[:zip], phone: session[:phone], email: session[:email], crust: session[:crust], sauce: session[:sauce], size: session[:size], veggies: session[:veggies], meats: session[:meats], cheese: session[:cheese], total_cost: session[:total_cost], more_pizza: session[:more_pizza], order_number: session[:order_number]}
end