FactoryGirl.define do
  factory :ecm_npo_ledger_items_payment, :class => Ecm::Npo::LedgerItems::Payment do
    issued_at 1.day.ago
  end
end
