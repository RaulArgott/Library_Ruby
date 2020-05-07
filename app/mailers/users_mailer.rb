class UsersMailer < ApplicationMailer
    def mail_user
        @user = params[:user]
        mail(to: @user.email, subject: 'Welcome to Library in Rails')        
    end
    
end