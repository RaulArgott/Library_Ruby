class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_many :loan
  has_many :favourite
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.to_csv
    attributes = %w{id email admin created_at}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.find_each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end
end
