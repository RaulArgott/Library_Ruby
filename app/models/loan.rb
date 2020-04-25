class Loan < ApplicationRecord
  belongs_to :user
  has_many :book_loan
  has_many :book, through: :book_loan
end
