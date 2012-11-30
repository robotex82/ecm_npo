require 'spec_helper'

module Ecm::Npo::EventDocuments
  describe MembershipBegin do
    context 'associations' do
      it { should belong_to :member }
    end

    context 'validations' do
      it { should validate_presence_of :member }
      it { should validate_presence_of :point_in_time }
    end
  end
end
