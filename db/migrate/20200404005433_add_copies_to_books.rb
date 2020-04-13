class AddCopiesToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :copies, :integer
  end
end
