class Book < ApplicationRecord
  belongs_to :publisher
  belongs_to :author
  belongs_to :bookshelf
  has_many :book_loan
  has_many :loan, through: :book_loan
  has_many :tag
end
