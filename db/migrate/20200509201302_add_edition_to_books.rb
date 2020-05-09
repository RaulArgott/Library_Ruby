class AddEditionToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :edition, :integer  
  end
end
