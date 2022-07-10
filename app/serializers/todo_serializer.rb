class TodoSerializer < ActiveModel::Serializer
  attributes :id, :description
  belongs_to :plan
end
