class CreateCitations < ActiveRecord::Migration[5.1]
  def change
    create_table :citations do |t|
      t.text :citation_text
      	
      t.timestamps
    end
  end
end
