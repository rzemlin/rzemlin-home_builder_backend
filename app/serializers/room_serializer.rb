class RoomSerializer < ActiveModel::Serializer
  attributes :id, :room_name, :plans, :comments
  has_many :plans
  has_many :comments
end
