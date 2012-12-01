module Ecm::Npo
  class LedgerItems::Payment < LedgerItem
    # associations
    belongs_to :claim, :class_name => 'Ecm::Npo::LedgerItems::Claim'

    # attributes
    attr_accessible :claim_id

    # citier
    acts_as_citier

    # validations
    validates :claim, :presence => true
  end
end

