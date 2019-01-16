class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
      t.string :username, :limit => 20
      t.string :password, :null => false
      t.column "email", :string, :default => 'example@dot.com', :null => false
	  t.has_many :posts

      t.timestamps
    end
  end

  def down
  	drop_table :users
  	
  end


end
