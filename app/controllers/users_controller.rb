class UsersController < ApplicationController
    # Resto del código del controlador
      has_one_attached :avatar
   

    def create
        @user = User.new(user_params)
    
        if @user.save
          redirect_to root_path, notice: 'Registro exitoso. ¡Bienvenido!'
        else
          render :new
        end
      end
    

    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
    end
  end
  
