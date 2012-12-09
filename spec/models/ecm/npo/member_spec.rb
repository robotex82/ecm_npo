require 'spec_helper'

module Ecm::Npo
  describe Member do
    context 'associations' do
      it { should have_many :issued_claims }
      it { should have_many :issued_payments }
      it { should have_many :membership_begins }
      it { should have_many :membership_ends }
      it { should have_many :membership_fees }
      it { should have_many :recieved_claims }
      it { should have_many :recieved_payments }
    end

    context 'account' do
      it 'should have an initial balance of 0' do
        member = Member.new
        member.account.balance.should eq(0)
      end

      it 'should calculate the balance' do
        member = Member.new
        member.recieved_payments << LedgerItems::Payment.new(:gross_amount => '9,99')
        member.issued_payments   << LedgerItems::Payment.new(:gross_amount => '4,99')
        member.account.balance.should eq(5.00)
      end
    end

    context 'age' do
      it 'should calculate the correct age on the birthday' do
        member = Member.new(:birthdate => 1.years.ago)
        member.age.should eq(1)
      end

      it 'should calculate the correct age one day after birthday' do
        member = Member.new(:birthdate => 1.years.ago - 1.day)
        member.age.should eq(1)
      end

      it 'should calculate the correct age one day before birthday' do
        member = Member.new(:birthdate => 1.years.ago + 1.day)
        member.age.should eq(0)
      end
    end

    context 'memberships' do
      it 'should have memberships' do
        member = Member.new
        membership_begin = member.membership_begins.build(:point_in_time => 2.years.ago)
        membership_end = member.membership_ends.build(:point_in_time => 1.year.from_now, :membership_begin => membership_begin)
        member.memberships.first.should be_a(Membership)
      end

      it 'should be an active when in membership range' do
        member = Member.new
        membership_begin = member.membership_begins.build(:point_in_time => 2.years.ago)
        member.should be_active
      end

      it 'should not be an active when outside of membership range' do
        member = Member.new
        membership_begin = member.membership_begins.build(:point_in_time => 2.years.ago)
        membership_end = member.membership_ends.build(:point_in_time => 1.minute.ago, :membership_begin => membership_begin)
        # make membership_begin aware of membership_end to circumvent database
        membership_begin.membership_end = membership_end
        member.should_not be_active
      end
    end

    context 'validations' do
      it { should validate_presence_of :birthdate }
      it { should validate_presence_of :firstname }
      it { should validate_presence_of :lastname }
    end
  end
end

