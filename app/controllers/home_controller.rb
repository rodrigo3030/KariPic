class HomeController < ApplicationController
    def index
        @posts = Post.includes(:comments)
        @posts = Post.all # Obtén todos los posts de la base de datos
        @post = Post.new  # Crea una nueva instancia de Post para el formulario de nueva publicación
        if user_signed_in?
            post_ids = @posts.pluck(:id)
            user_reactions = current_user.reactions.where(post_id: post_ids)
            @user_reactions = user_reactions.index_by(&:post_id)
        end
    end
end



  