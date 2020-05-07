class UsersController < ApplicationController
    before_action :authorize_admin, only: :create
    def index
        @users = User.all
    end
    def create
         @user = User.new(user_params)
         if @user.save
             redirect_to users_admin_index_path, notice: "User succesfully created!" 
         else
             render 'users/new'
         end
    end
  
    private
  
    # This should probably be abstracted to ApplicationController
    # as shown by diego.greyrobot
    def authorize_admin
    #   return unless !current_user.admin?
    #   redirect_to root_path, alert: 'Admins only!'
    end
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end