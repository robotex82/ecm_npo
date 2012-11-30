require 'spec_helper'

describe Ecm::Npo::LedgerItems::Payment do
  context 'associations' do
    it { should belong_to :issuer }
    it { should belong_to :recipient }
  end

  context 'validations' do
    it { should validate_presence_of :issued_at }
  end
end

