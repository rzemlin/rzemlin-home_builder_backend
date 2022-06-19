class Room < ApplicationRecord
  has_many :plans, dependent: :destroy
  has_many :to_dos, through: :plans
  has_many :comments
end
