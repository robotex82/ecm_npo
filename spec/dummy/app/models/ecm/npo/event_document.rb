class Ecm::Npo::EventDocument < ActiveRecord::Base
  # attributes
  attr_accessible :point_in_time

  # citier
  acts_as_citier

  # validations
  validates :point_in_time, :presence => true
end
