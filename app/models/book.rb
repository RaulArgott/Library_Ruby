class Book < ApplicationRecord
  belongs_to :publisher
  belongs_to :author
  belongs_to :bookshelf
  has_many :tag
end
