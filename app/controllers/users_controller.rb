class UsersController < ApplicationController
    before_action :authorize_admin, only: :create
    def index
        @users = User.where(admin: false)
        respond_to do |format|
            format.html
            format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
        end
    end
    def create
        @user = User.new(:email => user_params[:email], :password => user_params[:email].gsub(/@[^\s]+/,""), :password_confirmation => user_params[:email].gsub(/@[^\s]+/,""))
        if @user.save
            UsersMailer.with(user: @user).mail_user.deliver_now	
            redirect_to users_admin_index_path, notice: "User succesfully created!" 
        else
            render 'users/new'
        end
    end
    def destroy
        p params[:id]
        User.find(params[:id]).destroy
        flash[:success] = "User destroyed."
        redirect_to("/users_admin")
    end
  
    private
  
    # This should probably be abstracted to ApplicationController
    # as shown by diego.greyrobot
    def authorize_admin
    #   return unless !current_user.admin?
    #   redirect_to root_path, alert: 'Admins only!'
    end
    def user_params
        params.require(:user).permit(:email)
    end
  end