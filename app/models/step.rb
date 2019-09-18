class Step < ApplicationRecord
  acts_as_nested_set 
  belongs_to :resource
  belongs_to :track, optional: true
  validates :resource, :presence => true
  after_initialize do |step|
    byebug
    step.name ||= step.resource.name unless step.name
    byebug
  end
end
