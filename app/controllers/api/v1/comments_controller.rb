class Api::V1::CommentsController < ApplicationController
  def index
    comments = Comment.all
    render json: comments
  end

  def show
    log = Log.find(params[:id])
    render json: log
  end

  def create
    room = Room.find_by(id: params[:room_id])
    comment = room.build(comment_params)
    if comment.save
      render json: CommentSerializer.new(comment), status: :accepted
    else
      resp = {
        error: comment.errors.full_messages.to_sentence,
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  def update
    comment = Comment.find_by(id: params[:id])
    if comment.update(comment_params)
      render json: CommentSerializer.new(comment)
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    Comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :room_id)
  end
end
