class AvatarsController < ApplicationController
  def show
    # Buscar el usuario por su ID
    @user = User.find_by(id: params[:id])

    # Asegurarse de que se haya encontrado el usuario
    if @user
      # Obtener el avatar del usuario
      @avatar = @user.avatar

      # Asegurarse de que el usuario tenga un avatar adjunto
      if @avatar && @avatar.attached?
        # Enviar el avatar al navegador como tipo de contenido de imagen
        send_data @avatar.download, type: @avatar.content_type, disposition: 'inline'
      else
        # Si el usuario no tiene un avatar adjunto, redireccionar a una imagen de avatar predeterminada o manejar el error según tus necesidades
        redirect_to default_avatar_path
      end
    else
      # Si no se encontró el usuario, redireccionar a una imagen de avatar predeterminada o manejar el error según tus necesidades
      redirect_to default_avatar_path
    end
  end
end




