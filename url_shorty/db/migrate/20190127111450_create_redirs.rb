class CreateRedirs < ActiveRecord::Migration[5.2]
  def change
    create_table :redirs do |t|
      t.string :from
      t.string :hashed
      t.integer :visited
      t.datetime :last_visited

      t.timestamps
    end
  end
end