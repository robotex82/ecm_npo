require 'spec_helper'

module Ecm::Npo::LedgerItems::Claims
  describe MembershipFee do
    context 'associations' do
      it { should belong_to :member }
    end

    context 'time' do
      it 'should not be valid with a begin_date after end_date' do
        membership_fee = FactoryGirl.build(:ecm_npo_ledger_items_claims_membership_fee, :begin_date => 3.months.ago, :end_date => 4.months.ago)
        membership_fee.should_not be_valid
      end
    end

    context 'validations' do
      it { should validate_presence_of :begin_date }
      it { should validate_presence_of :end_date }
    end
  end
end

