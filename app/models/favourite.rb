class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :book
  def self.search(search)

        if search     
           where(["name LIKE ?","%#{search}%"])
        else
          all
        end
  end
end
