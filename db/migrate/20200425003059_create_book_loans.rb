class CreateBookLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :book_loans do |t|
      t.references :loan, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
