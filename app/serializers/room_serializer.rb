class RoomSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :room_name, :plans, :to_dos
  has_many :plans
  has_many :comments
end
