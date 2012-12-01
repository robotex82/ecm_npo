require 'spec_helper'

module Ecm::Npo::LedgerItems
  describe Payment do
    context 'accounting' do
      it 'should be transformable into an account item' do
        payment = Payment.new
        payment.gross_amount = 9.99
        payment.to_account_item.amount.should eq(Money.new(999))
      end
    end

    context 'associations' do
      it { should belong_to :claim }
      it { should belong_to :issuer }
      it { should belong_to :recipient }
    end

    context 'gross_amount' do
      it 'should handle money' do
        payment = Payment.new
        payment.gross_amount = 9.99
        payment.gross_amount.should eq(Money.new(999))
      end
    end

    context 'validations' do
      it { should validate_presence_of :claim }
      it { should validate_presence_of :issued_at }
    end
  end
end

