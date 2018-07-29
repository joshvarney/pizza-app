require 'sinatra'
require_relative 'pizza_app.rb'
enable :sessions

get '/' do
	erb :first_page
end
post '/first_page' do
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
	session[:size] = size
	session[:veggies] = veggies
	session[:meats] = meats
	session[:cheese] = cheese
	session[:pizza_cost] = pizza(size, veggies, meats, cheese)
	erb :first_page
	redirect '/second_page'
end
get '/second_page' do
	erb :second_page, locals:{pizza_cost: session[:pizza_cost], size: session[:size], veggies: session[:veggies], meats: session[:meats], cheese: session[:cheese]}
end