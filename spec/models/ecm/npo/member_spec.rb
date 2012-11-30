require 'spec_helper'

describe Ecm::Npo::Member do
  context 'associations' do
    it { should have_many :issued_claims }
    it { should have_many :issued_payments }
    it { should have_many :recieved_claims }
    it { should have_many :recieved_payments }
  end

  context 'validations' do
    it { should validate_presence_of :birthdate }
    it { should validate_presence_of :firstname }
    it { should validate_presence_of :lastname }
  end
end

