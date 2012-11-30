require 'spec_helper'

module Ecm::Npo
  describe Account do
    it 'should have an initial balance of 0' do
      revenues = []
      expenses = []
      account = Account.new(revenues, expenses)
      account.balance.should eq(0)
    end

    it 'should should calculate the balance' do
      revenues = [1000, 2000, 3000, 4000].map { |e| AccountItem.new(Money.new(e)) }
      expenses = [1000, 2000, 3000].map { |e| AccountItem.new(Money.new(e)) }
      account = Account.new(revenues, expenses)
      account.balance.should eq(Money.new(4000))
    end
  end
end

