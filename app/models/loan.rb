class Loan < ApplicationRecord
  has_one :penalty
  belongs_to :user
  has_many :book_loan
  has_many :book, through: :book_loan
  validates :due_date, presence: true, on: :create
  validates :loan_state, presence: true, on: :create
  validates :book_ids, presence: true, on: :create
  validates :user_id, presence: true, on: :create

  def self.check_loans
    loans = self.all
    today = Date.today    
    loans.each do |loan|   
    days = (Date.today - loan.due_date).to_i
      if loan.due_date < today then
        if loan.penalty.nil?
          penalty = Penalty.new(:fee => 5.0*days , :loan => loan , :user => loan.user)
          penalty.save
        else
          loan.penalty = Penalty.update(:fee => 5.0*days)
        end        
        loan.loan_state = 'Delayed'
      elsif loan.due_date > today then
        loan.loan_state = 'Loaned'
      else
        loan.loan_state = 'Pending'
      end
      loan.save
    end
  end
  def self.search(search,current_user)

        if search  
           where(user: current_user)   
           where(["loan_state LIKE ?","%#{search}%"])
        else
          all
        end
  end
end
