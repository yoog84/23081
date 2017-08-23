require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"#spzdaem podkluchenie k BD(esli menyaetsya BD,menyaetsya & stroka)

#sozdaem class kotory budet predstavlyat nashu sushnost
class Client <ActiveRecord::Base#class nasleduetsya ot activerecord base(vse s bolsh bukvi)
	#vizov metoda(funkcii) #proveryaem v parametrah, vvedeno li chto to v polyah(imya,telefon itd) v html forme
	validates :name, presence: true #name- parametr1, presence(prisutstvie)- parametr 2 s tipom hash
	validates :phone, presence: true, length: {minimum: 3, maximum: 6} #validations na dlinnu stroki
	validates :datestamp, presence: true
	validates :color, presence: true
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
	@c = Client.new
	erb :visit
end

post '/visit' do

	@c = Client.new params[:client]
	#delaem soobshenie ob oshibke
	if @c.save
		erb "<h2> Spasibo vi zapisalis </h2>"
	else
		@error = @c.errors.full_messages.first#u modely C. est svoystvo errors,u errors,est svoystvo full_messages(eto massiv),
		erb :visit                           # u klassa massiv est metod first,kotory vozvrashaet pervy element massiva
	end
end

get '/barber/:id' do
	@barber = Barber.find(params[:id])
	erb :barber
end

get '/bookings' do
	@clients = Client.order('created_at DESC')
	erb :bookings
end
