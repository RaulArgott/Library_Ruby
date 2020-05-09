class Book < ApplicationRecord
  belongs_to :publisher
  belongs_to :author
  belongs_to :bookshelf
  has_many :book_tag
  has_many :tag, through: :book_tag
  has_many :book_loan
  has_many :loan, through: :book_loan
  validates :name, presence: { message: "must be given please" }
  validates :name, length: { 
    minimum: 5,
    maximum: 30,
  }
  before_save :upcase_fields
  def upcase_fields
    self.name.upcase!
  end
  def self.tagger_with(name)
    Tag.find_by_name!(name).books
  end
  def self.tag_counts 
    Tag.select("tags.*, count(book_tags.tag_id) as count").joins(:book_tags).group("book_tags.tag_id")
  end
  def tag_list
    tags.map(&:name).join(", ")
  end
  def tag_list=(name)
    self.tag = name.split(",").map do |n|
      Tag.where(name: n.strips).first_or_create!
    end
  end
end
