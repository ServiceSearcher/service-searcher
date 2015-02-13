class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]

  respond_to :html, :json

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to(:back)
    # respond_to do |format|
    #   if @comment.save
    #     format.html { redirect_to(:back), notice: 'Comment was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @comment }
    #     format.js   { render action: 'show', status: :created, location: @comment }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @comment.errors, status: :unprocessable_entity }
    #     format.js   { render json: @comment.errors, status: :unprocessable_entity }
    #   end
    # end
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
