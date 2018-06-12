class ApplicationController < ActionController::Base
    # include SessionsHelper
    
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller? 
    
    def authenticate_user!
        redirect_to new_session_path if !user_signed_in? 
    end

    protected 
    
    def configure_permitted_parameters 
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) 
        devise_parameter_sanitizer.permit(:account_update, keys: [:name]) 
    end 

end
