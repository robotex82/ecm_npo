FactoryGirl.define do
  factory :ecm_npo_ledger_items_claim, :class => Ecm::Npo::LedgerItems::Claim do
    gross_amount '9,99'
    issued_at 1.day.ago
  end
end

