module Ecm::Npo
  class EventDocuments::MembershipBegin < EventDocument
    # associations
    belongs_to :member
    has_one :membership_end

    # citier
    acts_as_citier

    # validations
    validates :member, :presence => true

    def membership_end_point_in_time
      membership_end.point_in_time if membership_end.respond_to?(:point_in_time)
    end

    def to_membership
      Membership.new(point_in_time, membership_end_point_in_time)
    end
  end
end
