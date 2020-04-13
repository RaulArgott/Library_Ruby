class CreateBookshelves < ActiveRecord::Migration[5.1]
  def change
    create_table :bookshelves do |t|
      t.integer :number
      t.string :side

      t.timestamps
    end
  end
end
