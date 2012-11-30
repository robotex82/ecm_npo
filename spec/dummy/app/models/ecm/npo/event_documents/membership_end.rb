module Ecm::Npo
  class EventDocuments::MembershipEnd < EventDocument
    # associations
    belongs_to :member
    belongs_to :membership_begin

    # attributes
    attr_accessible :member,
                    :membership_begin

    # citier
    acts_as_citier

    # validations
    validates :member, :presence => true
    validates :membership_begin, :presence => true
    validates :point_in_time, :date => { :after => :membership_begin_point_in_time }

    def membership_begin_point_in_time
      membership_begin.point_in_time
    end
  end
end
