FactoryGirl.define do
  factory :ecm_npo_ledger_items_claim, :class => Ecm::Npo::LedgerItems::Claim do
    issued_at 1.day.ago
  end
end

