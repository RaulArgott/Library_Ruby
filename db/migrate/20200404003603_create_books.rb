class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :code
      t.string :name
      t.references :publisher, foreign_key: true
      t.references :author, foreign_key: true
      t.string :genre
      t.integer :pages
      t.integer :year
      t.string :language
      t.references :bookshelf, foreign_key: true

      t.timestamps
    end
  end
end
