require 'sinatra'
require_relative 'pizza_app.rb'
enable :sessions

get '/' do
	erb :first_page, locals:{pizza_cost: ""}
end
post '/first_page' do
	delivery = params[:delivery]
		if delivery == "2"
			delivery = 2
		else 
			delivery = 0
		end
	name = params[:name]
	address = params[:address]
	zip = params[:zip]
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
	erb :first_page, locals:{pizza_cost: session[:pizza_cost]}
end