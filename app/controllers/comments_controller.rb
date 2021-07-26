class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render json: @comments, include: :user
  end

  def create
    @comment = Comment.create comment_params
    render json: @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:input, :post_id).merge(user: @user)
  end
end
