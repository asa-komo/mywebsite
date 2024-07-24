class PostsController < ApplicationController
    
    def index
        @posts = Post.all.order(created_at: 'desc')
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    def new
        @post = Post.new
        authorize @post
    end
    
    def create
        @post = Post.new(post_params.merge({user_id: session[:user_id]}))
        authorize @post
        if @post.save
            redirect_to posts_path
        else
            render "new", status: :unprocessable_entity
        end
    end
    
    def edit
        @post = Post.find(params[:id])
        authorize @post
    end
    
    def update
        @post = Post.find(params[:id])
        authorize @post
        if @post.update(post_params)
            redirect_to posts_path
        else
            render "edit",status: :unprocessable_entity
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        authorize @post
        @post.destroy
        redirect_to posts_path
    end
        
    private
    def post_params
        params.require(:post).permit(:title, :body)
    end
    
end