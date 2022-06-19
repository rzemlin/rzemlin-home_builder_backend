class PlanSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :description
  belongs_to :room
  has_many :to_dos
end
