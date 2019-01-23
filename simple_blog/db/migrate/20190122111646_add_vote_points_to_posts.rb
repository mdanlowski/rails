class AddVotePointsToPosts < ActiveRecord::Migration[5.2]
  def up
  	change_table :posts do |t|
  		t.integer :vote_points, :default => 0
  	end
  	Post.update_all vote_points: 0
  end
  def down
  	remove_column :posts, :vote_points
  end
end
