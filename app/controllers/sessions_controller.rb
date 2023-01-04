class SessionsController < ApplicationController
    skip_before_action :authenticate_user!, only: %i[login create]
    skip_before_action :user_has_profile?

    def create
        # debugger

        @user = User.find_by(email: params[:session][:email])

        if @user.present? && @user.authenticate(params[:session][:password])
            if @user.is_confirmed?
                session[:user_id] = @user.id
                redirect_to root_path, notice: "Login successfully."
            else
                redirect_to login_path, notice: "You have to confirm your account."
            end
        else
            redirect_to login_path, notice: "Email or password incorrect."
        end
    end

    def login
    end

    def destroy
        session[:user_id] = nil
        redirect_to login_path, notice: "Logout successfully."
    end
end
