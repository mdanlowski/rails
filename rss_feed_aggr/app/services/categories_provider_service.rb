class CategoriesProviderService

  @@entry_categories_global = []

  def initialize()
  end

  def self.provide
    @@entry_categories_global
  end

  def self.call
    # update categories repository
    Entry.find_each(batch_size: 10) do |entry|
      entry.categories.each do |cat|
        unless @@entry_categories_global.include? cat
          @@entry_categories_global.push(cat)
        end
      end
    end
    puts "=======================CATEGORIES UPDATED============================"    
  end

end