class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :user_has_profile?

    # si no se usa helper_method, el metodo current_user solo estara disponible en los controladores
    # al usar helper_method, permite que el metodo current_user este disponible en todos los views de la aplicacion
    helper_method :current_user

    # Devuelve el usuario logueado o nil si no hay usuario logueado
    def current_user
        # if session[:user_id]
            # User.find(session[:user_id])
        # end
        # Refactorizado queda de la siguiente manera
        current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    private

    def authenticate_user!
        # if !current_user
        # otra forma de hacer if !algo es unless algo, ej unless current_user
        # redirect_to login_path, notice: 'You have to be logged in.'
        # Refactorizado queda de la siguiente manera
        redirect_to login_path, notice: 'You have to be logged in.' if !current_user
    end

    def user_has_profile?
        if current_user && current_user.profile.nil?
            redirect_to new_profile_path, notice: 'Tell us more about you.'
        end
    end
end
