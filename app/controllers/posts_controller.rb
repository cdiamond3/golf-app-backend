class PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts, include: [:user, {comments: {include: :user}}]
  end

  def create
    @post = Post.create post_params
    render json: @post, except: :password_digest
  end

  private

  def post_params
    params.require(:post).permit(:input, :date).merge(user: @user)
  end
end
