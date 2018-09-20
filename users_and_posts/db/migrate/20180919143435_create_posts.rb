class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
    	t.integer :authorid
    	t.string :posttitle
    	t.text :postbody

    	t.timestamps
    end
  end
end
