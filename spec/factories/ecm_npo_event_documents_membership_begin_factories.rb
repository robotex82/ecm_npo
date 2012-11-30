FactoryGirl.define do
  factory :ecm_npo_event_documents_membership_begin, :class => Ecm::Npo::EventDocuments::MembershipBegin do
    point_in_time 2.days.ago
    association :member, :factory => :ecm_npo_member
  end
end

