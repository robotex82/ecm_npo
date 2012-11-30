FactoryGirl.define do
  factory :ecm_npo_member, :class => Ecm::Npo::Member do
    firstname 'John'
    lastname 'Doe'
    birthdate 20.years.ago
  end
end
