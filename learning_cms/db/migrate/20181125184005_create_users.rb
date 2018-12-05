class CreateUsers < ActiveRecord::Migration[5.1]
  # def change
  #   create_table :users do |t|

  #     t.timestamps
  #   end
  # end
  def up
  	# create_table :users, :id => false do |t|
  	create_table :users do |t|

  		t.column "first_name", :string, :limit => 25
  		t.string "last_name", :limit => 50	# works just as the format in above line
  		t.string "email", :default => '', :null => false
  		t.string "password", :limit => 40

  		# other types: 
		#   binary, bolean, date, datetime, decimal, float, integer, string, text, time
		# options:
		#   :limit => size
		#   :default => value
		#   :null => true/false
		#   :precision => number
		#   :scale => number

  		# t.datetime "created_at"
  		# t.datetime "updated_at"
  		t.timestamps # ==> created_at & updated_at
  	end
  end

  def down
  	drop_table :users
  	
  end


end
