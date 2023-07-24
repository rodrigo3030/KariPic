class ApplicationController < ActionController::Base
    # Otros códigos y configuraciones
  
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar]) # Agrega :avatar a los parámetros permitidos para el registro
    end
  end
  



