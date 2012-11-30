require 'spec_helper'

module Ecm::Npo
  describe AccountItem do
    it 'should have an amount' do
      accountable = FactoryGirl.create(:ecm_npo_ledger_items_claim, :gross_amount => '9,99')
      account_item = AccountItem.new(accountable.gross_amount)
      account_item.amount.should eq(Money.new(999))
    end
  end
end

