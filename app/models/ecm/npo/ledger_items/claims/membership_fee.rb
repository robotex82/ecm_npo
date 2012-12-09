module Ecm::Npo
  class LedgerItems::Claims::MembershipFee < LedgerItems::Claim
    # associations
    belongs_to :member, :class_name => 'Member'

    # attributes
    attr_accessible :begin_date,
                    :end_date,
                    :member_id

    # citier
    acts_as_citier

    # validations
    validates :begin_date, :presence => true
    validates :end_date, :presence => true,
                         :date => { :after => :begin_date }
  end
end

