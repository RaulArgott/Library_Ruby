class Loan < ApplicationRecord
  belongs_to :user
  has_many :book_loan
  has_many :book, through: :book_loan

  validates :due_date, presence: true, on: :create
  validates :loan_state, presence: true
  validates :book_ids, presence: true, on: :create
  validates :user_id, presence: true, on: :create

  def self.check_loans
    loans = self.all
    today = Date.today    
    loans.each do |loan|   
      days = (loan.due_date - Date.today).to_i
      if loan.due_date < today then
        loan.loan_state = 'Delayed'
      elsif loan.due_date > today then
        loan.loan_state = 'Loaned'
      else
        loan.loan_state = 'Pending'
      end
      loan.save
    end
  end
end
