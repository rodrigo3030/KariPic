class PostsController < ApplicationController
    before_action :set_post, only: [:edit, :update, :destroy]
    before_action :authorize_user, only: [:edit, :update, :destroy]
    before_action :current_user_logged, only: [:index, :new, :create, :edit, :update, :destroy]
  
    def index
      @posts = Post.all
    end
  
    def new
      @post = Post.new
    end
  
    def edit
    end
  
    def create
      @post = Post.new(post_params)
  
      respond_to do |format|
        if @post.save
          format.html { redirect_to root_path, notice: "Post was successfully created." }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to root_path, notice: "Post was successfully updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @post.destroy
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Post was successfully destroyed." }
      end
    end
  
    private
    
    def authorize_user
      @post = Post.find(params[:id])
      unless @post.user == current_user
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to root_path
      end
    end
  
    def set_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:content, :post_id, :title, :content, :image).merge(user_id: current_user.id)
    end
  
    def current_user_logged
      # Coloca aquí la lógica para verificar si el usuario está logueado
      # y redirige o realiza cualquier acción necesaria.
    end
  end
  