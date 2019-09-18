class Track < ApplicationRecord
  has_one :step
  validates :name, presence: true
  # TODO set a max ?
  validates :step, presence: true 
end
