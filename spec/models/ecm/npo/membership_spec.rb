require 'spec_helper'

module Ecm::Npo
  describe Membership do
    it 'should know if is active' do
      membership_begin = 3.years.ago
      membership = Membership.new(membership_begin)
      membership.should be_active
    end

    it 'should know its length' do
      membership_begin = 3.years.ago
      membership_end = membership_begin + 2.years
      membership = Membership.new(membership_begin, membership_end)
      membership.length.should eq(membership_end - membership_begin)
    end

    it 'should have an infinite length with no end_date' do
      membership_begin = 3.years.ago
      membership = Membership.new(membership_begin)
      membership.length.should eq(1.0 / 0.0)
    end
  end
end

