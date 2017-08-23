#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"#spzdaem podkluchenie k BD(esli menyaetsya BD,menyaetsya & stroka)

#sozdaem class kotory budet predstavlyat nashu sushnost
class Client <ActiveRecord::Base#class nasleduetsya ot activerecord base(vse s bolsh bukvi)
	end

class Barber <ActiveRecord::Base#class nasleduetsya ot activerecord base(vse s bolsh bukvi)
	end

get '/' do
	#vivod na ekran vsex parikmaherov
	@barbers = Barber.all
	#vivod na ekran vsex parikmaherov s sortirovkoy
	#@barbers = Barber.order "created_at DESC"
	erb :index
end


#ispravit na 30
get '/visit' do
	@c = Client.new
	erb :visit
end

post '/visit' do

	@c = Client.new params[:client]
	if @c.save
		erb "<h2>Спасибо, вы записались!</h2>"
	else
		@error = @c.errors.full_messages.first
		erb :visit
	end
end