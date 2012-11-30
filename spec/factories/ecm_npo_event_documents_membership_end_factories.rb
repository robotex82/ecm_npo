FactoryGirl.define do
  factory :ecm_npo_event_documents_membership_end, :class => Ecm::Npo::EventDocuments::MembershipEnd do
    point_in_time 1.day.ago
    association :member, :factory => :ecm_npo_member
    association :membership_begin, :factory => :ecm_npo_event_documents_membership_begin
  end
end

