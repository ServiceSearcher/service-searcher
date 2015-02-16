class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]

  respond_to :html, :json

  def create
    @comment = Comment.new(comment_params)
    binding.pry
    @comment.save
    redirect_to(:back)
  end

  def update
    @comment.update(comment_params)
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    respond_with(@comment)
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:rating, :text, :display_name, :service_id, :user_id)
    end
end
