class CreateFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :feeds do |t|
      t.string :name
      # t.string :category # relation? - yes
      # t.string :source_url
      # t.boolean :feed_active
      # t.integer :update_interval # OR TIME?

      t.timestamps
    end
  end
end
