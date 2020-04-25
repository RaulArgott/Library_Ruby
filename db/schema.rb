# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200425003059) do

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_loans", force: :cascade do |t|
    t.integer "loan_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_loans_on_book_id"
    t.index ["loan_id"], name: "index_book_loans_on_loan_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "publisher_id"
    t.integer "author_id"
    t.string "genre"
    t.integer "pages"
    t.integer "year"
    t.string "language"
    t.integer "bookshelf_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "copies"
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["bookshelf_id"], name: "index_books_on_bookshelf_id"
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "bookshelves", force: :cascade do |t|
    t.integer "number"
    t.string "side"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favourites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_favourites_on_book_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "loans", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_id"
    t.date "loaned_on"
    t.date "due_date"
    t.date "returned_on"
    t.string "loan_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_loans_on_book_id"
    t.index ["user_id"], name: "index_loans_on_user_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_tags_on_book_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
