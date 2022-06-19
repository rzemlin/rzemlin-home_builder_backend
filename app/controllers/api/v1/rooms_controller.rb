class Api::V1::RoomsController < ApplicationController
  def index
    rooms = Room.all
    render json: RoomSerializer.new(rooms)
  end

  def show
    room = Room.find(params[:id])
    render json: RoomSerializer.new(room)
  end

  def create
    room = Room.create(room_params)
    if room.save
      render json: RoomSerializer.new(room), status: :accepted
    else
      resp = {
        error: room.errors.full_messages.to_sentence,
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  def destroy
    rooms = Room.all
    room = Room.find(params[:id])
    room.destroy
    render json: RoomSerializer.new(rooms)
  end

  private

  def room_params
    params.require(:room).permit(:room_name)
  end
end
