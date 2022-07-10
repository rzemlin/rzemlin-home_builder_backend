class Plan < ApplicationRecord
  belongs_to :room
  has_many :todos, dependent: :destroy
end
