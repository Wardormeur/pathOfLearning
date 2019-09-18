class Resource < ApplicationRecord
  has_many :steps
  validates :name, presence: true
  validates :url, url: true 
end
