class Tag < ApplicationRecord
  has_many :book_tag
  has_many :book, through: :book_tag
end
