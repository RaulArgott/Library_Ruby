class LoansController < ApplicationController
    def index
        @loans = all_loans
    end
    def show
        @loan = find_loan_id
    end
    def new
        @loan = Loan.new
        @book = Book.new
        @user = User.new
    end
    def create
        
        @loan = Loan.new(post_params(:due_date, :loan_state))
        @book = Book.find(post_params(:book)[:book])
        @user = User.find(post_params(:user)[:user])    
        @loan.save
        redirect_to loan_path(@loan)
    end
    def edit
        @loan = find_loan_id
    end    
    def update
        @loan = find_loan_id
        @loan.update(post_params(:name, :city))
        redirect_to loan_path(@loan)
    end
    def destroy
        @loan = find_loan_id
        @loan.destroy
        redirect_to loans_path
    end
    private    
    def all_loans
        Loan.all
    end
    def find_loan_id
        Loan.find(params[:id])
    end
    def post_params(*args)
        params.require(:loan).permit(*args)
    end
end
