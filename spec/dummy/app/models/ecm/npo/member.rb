module Ecm::Npo
  class Member < ActiveRecord::Base
    # associations
    belongs_to :user
    has_many :issued_claims, :class_name => 'LedgerItems::Claim', :as => :issuer
    has_many :issued_payments, :class_name => 'LedgerItems::Payment', :as => :issuer
    has_many :recieved_claims, :class_name => 'LedgerItems::Claim', :as => :recipient
    has_many :recieved_payments, :class_name => 'LedgerItems::Payment', :as => :recipient

    # attributes
    attr_accessible :birthdate,
                    :firstname,
                    :lastname,
                    :nickname,
                    :slug

    # validations
    validates :birthdate, :presence => true
    validates :firstname, :presence => true
    validates :lastname, :presence => true
  end
end

