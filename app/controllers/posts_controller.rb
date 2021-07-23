class PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts, include: :comments
  end

  def create
    @post = Post.create comment_params
    render json: @post, except: :password_digest
  end

  private

  def comment_params
    params.require(:post).permit(:user, :input, :date)
  end
end
