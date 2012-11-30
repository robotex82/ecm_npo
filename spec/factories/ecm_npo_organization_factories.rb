FactoryGirl.define do
  factory :ecm_npo_organization, :class => Ecm::Npo::Organization do
    sequence(:name) { |i| "Organization ##{i}" }
  end
end
