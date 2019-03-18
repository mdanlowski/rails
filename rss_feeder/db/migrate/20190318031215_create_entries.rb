class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :url, :default => "Not given"
      t.string :guid, :default => "Not given"
      t.string :title, :default => "Not given"
      t.string :author, :default => "Not given"
      t.string :categories, :default => "Not given"
      t.text :summary
      t.text :content
      t.datetime :published
      
      t.belongs_to :feed, index: false

      t.timestamps
    end
  end
end
