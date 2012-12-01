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
      it { should have_many :payments }
    end

    context 'gross_amount' do
      it 'should handle money' do
        claim = Claim.new
        claim.gross_amount = 9.99
        claim.gross_amount.should eq(Money.new(999))
      end
    end

    context 'paid' do
      it 'should be paid when there are payments with an amount > gross_amount' do
        claim = Claim.new(:gross_amount => '50,00')
        claim.payments.build(:gross_amount => '20,00')
        claim.payments.build(:gross_amount => '30,00')
        claim.should be_paid
      end

      it 'should be paid when there are payments with an amount == gross_amount' do
        claim = Claim.new(:gross_amount => '50,00')
        claim.payments.build(:gross_amount => '50,00')
        claim.should be_paid
      end

      it 'should not be paid when there are payments with an amount < gross_amount' do
        claim = Claim.new(:gross_amount => '50,00')
        claim.payments.build(:gross_amount => '49,99')
        claim.should_not be_paid
      end
    end

    context 'validations' do
      it { should validate_presence_of :issued_at }
    end
  end
end

