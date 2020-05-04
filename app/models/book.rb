class Book < ApplicationRecord
  belongs_to :publisher
  belongs_to :author
  belongs_to :bookshelf
  has_many :book_loan
  has_many :loan, through: :book_loan
  has_many :tag
  validates :name, presence: { message: "must be given please" }
  validates :name, length: { 
    minimum: 5,
    maximum: 30,
  }
  before_save :upcase_fields
  def upcase_fields
    self.name.upcase!
  end
end
