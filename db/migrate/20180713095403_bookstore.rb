class Bookstore < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |b|
      b.string :title
      b.string :author
      b.boolean :read 
    end
  end
end
