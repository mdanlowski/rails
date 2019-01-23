class AddVotedForToUsers < ActiveRecord::Migration[5.2]
  def up
  	change_table :users do |t|
  		t.string :voted_for
  	end
  	User.update_all voted_for: []
  end
  def down
  	remove_column :users, :voted_for
  end
end
