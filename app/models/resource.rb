class Resource < ApplicationRecord
  include PgSearch::Model
  has_many :steps
  validates :name, presence: true
  validates :url, url: true 
  pg_search_scope :search_by_name, against: :name
end
