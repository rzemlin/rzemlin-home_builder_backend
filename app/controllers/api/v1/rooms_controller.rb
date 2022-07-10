class Api::V1::RoomsController < ApplicationController

  def index
      rooms = Room.all
      render json: rooms, include: ['plans', 'plans.todos', 'comments']
  end

  def show
      room = Room.find(params[:id])
      render json: room, include: ['plans', 'plans.todos', 'comments']
  end

  def create
      room = Room.new(room_params)
      if room.save
          render json: room, status: :accepted
     else
         resp = {
             error: room.errors.full_messages.to_sentence
         }
         render json: resp, status: :unprocessable_entity
     end
  end

  def destroy
      rooms = Room.all
      room = Room.find(params[:id])
      room.destroy
      render json: rooms, include: ['plans', 'plans.todos', 'comments']
  end

  private

  def room_params
      params.require(:room).permit(:room_name)
  end
end