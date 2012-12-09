FactoryGirl.define do
  factory :ecm_npo_ledger_items_claims_membership_fee, :class => Ecm::Npo::LedgerItems::Claims::MembershipFee do
    gross_amount '9,99'
    issued_at 1.day.ago
    begin_date 4.months.ago
    end_date 1.month.ago    
  end
end

