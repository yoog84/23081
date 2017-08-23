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

before do
	#vivod na ekran vsex parikmaherov
	@barbers = Barber.all
end

get '/' do
	erb :index
end

get '/visit' do
	erb :visit
end

post '/visit' do

	c = Client.new params[:client]
	c.save

	erb "<h2> Spasibo vi zapisalis </h2>"

end