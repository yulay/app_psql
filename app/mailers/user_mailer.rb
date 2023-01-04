class UserMailer < ApplicationMailer
    def confirm_account
        @user = params[:user]
        @url = "http://127.0.0.1:3000/confirm_email/#{@user.token}"
        mail(to: @user.email, subject: 'Welcome to My articles and users app')
    end
end