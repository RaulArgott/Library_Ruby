class StudentsController < ApplicationController
    def index
        @users = User.where(admin: false)    
    end
    def edit
        @user = User.find(params[:id])
    end
end
