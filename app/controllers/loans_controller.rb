class LoansController < ApplicationController
    before_action :authorize_admin, except: [:index, :show]
    helper_method :state
    def index
        if current_user.admin
            @loaned = Loan.where.not(loan_state: 'Returned')
            @returned = Loan.where(loan_state: 'Returned')
        else
            @loaned = Loan.where(user: current_user)
        end
    end
    def show
        @loan = find_loan_id
    end
    def new
        @loan = Loan.new
        @books = Book.all
        @users = User.where(admin: false)
    end
    def create
        @loan = Loan.new(post_params(:due_date, :loan_state,  :user_id, book_ids: []))
        if @loan.save
            @loan.book.each do |book|
                book.available -= 1
                book.save
            end
            flash[:alert] = "Book(s) loaned!"
            redirect_to loan_path(@loan)
        else 
            @books = Book.all
            @users = User.where("available > ?", 0)
            flash[:alert] = "Something gone wrong!"
            render :new
        end
        
    end
    def edit
        @loan = find_loan_id
    end 
      
    def update
        @loan = find_loan_id
        @loan.update(post_params(:due_date, :fee, :pay, :days))
        redirect_to loan_path(@loan)
    end
    def destroy
        @loan = find_loan_id
        @loan.destroy
        redirect_to loans_path
    end
    def state(loan)
        if loan.loan_state == 'Pending'
            return 'table-warning'
        elsif loan.loan_state == 'Delayed'
            return 'table-danger'
        end
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

    def authorize_admin
        return unless !current_user.admin?
        redirect_to loans_path, alert: 'Admins only!'
    end

end
