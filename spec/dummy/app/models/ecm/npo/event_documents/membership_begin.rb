module Ecm::Npo
  class EventDocuments::MembershipBegin < EventDocument
    # associations
    belongs_to :member

    # citier
    acts_as_citier

    # validations
    validates :member, :presence => true
  end
end
