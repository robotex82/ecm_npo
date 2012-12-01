FactoryGirl.define do
  factory :ecm_npo_ledger_items_payment, :class => Ecm::Npo::LedgerItems::Payment do
    gross_amount '9,99'
    issued_at 1.day.ago
    association :claim, :factory => :ecm_npo_ledger_items_claim
  end
end
