class ToDoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :description
  belongs_to :plan
end
