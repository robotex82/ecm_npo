require 'spec_helper'

describe Ecm::Npo::Member do
  context 'validations' do
    it { should validate_presence_of :birthdate }
    it { should validate_presence_of :firstname }
    it { should validate_presence_of :lastname }
  end
end

