class Publisher < ApplicationRecord
    has_many :book
    before_save :upcase_fields
    validates :name, presence: true
    validates :city, presence: true
    def upcase_fields
        self.name.upcase!
        self.city.upcase!
    end
end
