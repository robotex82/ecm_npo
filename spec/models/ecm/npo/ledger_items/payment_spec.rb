require 'spec_helper'

describe Ecm::Npo::LedgerItems::Payment do
  context 'validations' do
    it { should validate_presence_of :issued_at }
  end
end
