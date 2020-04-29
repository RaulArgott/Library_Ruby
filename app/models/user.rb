class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_many :loan
  has_many :favourite
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
