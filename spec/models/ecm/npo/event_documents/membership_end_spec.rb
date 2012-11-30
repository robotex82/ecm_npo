require 'spec_helper'

module Ecm::Npo::EventDocuments
  describe MembershipEnd do
    context 'associations' do
      it { should belong_to :member }
      it { should belong_to :membership_begin }
    end

    context 'time' do
      it 'should know its membership begin point in time' do
        membership_end = FactoryGirl.build(:ecm_npo_event_documents_membership_end)
        membership_end.membership_begin_point_in_time.should eq(membership_end.membership_begin.point_in_time)
      end

      it 'should not be valid with a point in time before membership begin' do
        membership_begin = FactoryGirl.build(:ecm_npo_event_documents_membership_begin, :point_in_time => 1.day.ago)
        membership_end = FactoryGirl.build(:ecm_npo_event_documents_membership_end, :membership_begin => membership_begin, :point_in_time => 2.days.ago)
        membership_end.should_not be_valid
      end
    end

    context 'validations' do
      it { should validate_presence_of :member }
      it { should validate_presence_of :membership_begin }
      it { should validate_presence_of :point_in_time }
    end
  end
end

