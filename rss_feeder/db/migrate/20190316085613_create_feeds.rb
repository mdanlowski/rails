class CreateFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :feeds do |t|
      t.string :name
      t.text :description
      t.string :url
      t.string :guid # md5 from name+url
      t.datetime :last_published_at
      
      # update settings
      t.boolean :feed_active, default: true
      t.integer :update_interval # IN MINUTES
      t.integer :keep_n_last

      t.timestamps
    end
  end
end
