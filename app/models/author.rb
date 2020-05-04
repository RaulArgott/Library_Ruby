class Author < ApplicationRecord
    has_many :book
    before_save :upcase_fields
    def upcase_fields
        self.name.upcase!
        self.last_name.upcase!
    end
end
