class Room < ApplicationRecord
  has_many :plans, dependent: :destroy
  has_many :todos, through: :plans, dependent: :destroy
  has_many :comments, dependent: :destroy
end
