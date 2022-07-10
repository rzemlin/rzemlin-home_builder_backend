class GoalSerializer < ActiveModel::Serializer
  attributes :id, :description, :todos
  belongs_to :room
  has_many :todos

end