class Step < ApplicationRecord
  has_ancestry
  belongs_to :resource
  belongs_to :track, optional: true
  validates :resource, :presence => true
  before_validation :set_name
  private
    def set_name 
      self.name ||= self.resource.name unless self.name
    end
end
