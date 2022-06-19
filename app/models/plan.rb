class Plan < ApplicationRecord
  belongs_to :room
  has_many :to_dos, dependent: :destroy
end
