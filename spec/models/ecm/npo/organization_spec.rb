require 'spec_helper'

module Ecm::Npo
  describe Organization do
    context 'associations' do
      it { should have_many :issued_claims }
      it { should have_many :issued_payments }
      it { should have_many :recieved_claims }
      it { should have_many :recieved_payments }
    end

    context 'account' do
      it 'should have an initial balance of 0' do
        organization = Organization.new
        organization.account.balance.should eq(0)
      end

      it 'should calculate the balance' do
        organization = Organization.new
        organization.recieved_payments << LedgerItems::Payment.new(:gross_amount => '9,99')
        organization.issued_payments   << LedgerItems::Payment.new(:gross_amount => '4,99')
        organization.account.balance.should eq(5.00)
      end
    end

    context 'validations' do
      it { should validate_presence_of :name }
    end
  end
end

