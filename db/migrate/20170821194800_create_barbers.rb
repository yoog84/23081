class CreateBarbers < ActiveRecord::Migration[5.1]
  def change

  	create_table :barbers do |t|
  		t.text :name

  		t.timestamps
  	end

	#napolnenie tablicy parikmaheramy(funkciya create prinimaet vid hash)
	Barber.create :name => 'Jessie Pinkman'
	Barber.create :name => 'Walter White'
	Barber.create :name => 'Gus Fring'

end
end
