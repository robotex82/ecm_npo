class Ecm::Npo::Member < ActiveRecord::Base
  # associations
  belongs_to :user

  # attributes
  attr_accessible :birthdate,
                  :firstname,
                  :lastname,
                  :nickname,
                  :slug

  # validations
  validates :birthdate, :presence => true
  validates :firstname, :presence => true
  validates :lastname, :presence => true
end

