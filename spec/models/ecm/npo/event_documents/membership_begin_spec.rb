require 'spec_helper'

module Ecm::Npo::EventDocuments
  describe MembershipBegin do
    context 'associations' do
      it { should belong_to :member }
      it { should have_one :membership_end }
    end

    context '#membership_end_point_in_time' do
      it 'should return the membership end point in time' do
        membership_begin = MembershipBegin.new
        membership_end = membership_begin.build_membership_end(:point_in_time => 1.day.ago)
        membership_begin.membership_end_point_in_time.should eq(membership_end.point_in_time)
      end
    end

    context '#to_membership' do
      it 'should return a membership' do
        membership_begin = MembershipBegin.new
        membership_begin.to_membership.should be_a(Ecm::Npo::Membership)
      end
    end

    context 'validations' do
      it { should validate_presence_of :member }
      it { should validate_presence_of :point_in_time }
    end
  end
end
