class Room < ApplicationRecord
  has_many :plans, dependent: :destroy
  has_many :todos, through: :plans
  has_many :comments
end
