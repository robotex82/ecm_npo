require 'spec_helper'

module Ecm::Npo::LedgerItems
  describe Claim do
    context 'accounting' do
      it 'should be transformable into an account item' do
        claim = Claim.new
        claim.gross_amount = 9.99
        claim.to_account_item.amount.should eq(Money.new(999))
      end
    end

    context 'associations' do
      it { should belong_to :issuer }
      it { should belong_to :recipient }
    end

    context 'gross_amount' do
      it 'should handle money' do
        claim = Claim.new
        claim.gross_amount = 9.99
        claim.gross_amount.should eq(Money.new(999))
      end
    end

    context 'validations' do
      it { should validate_presence_of :issued_at }
    end
  end
end

