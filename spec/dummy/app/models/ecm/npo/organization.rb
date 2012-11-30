module Ecm::Npo
  class Organization < ActiveRecord::Base
    # associations
    has_many :issued_claims, :class_name => 'LedgerItems::Claim', :as => :issuer
    has_many :issued_payments, :class_name => 'LedgerItems::Payment', :as => :issuer
    has_many :recieved_claims, :class_name => 'LedgerItems::Claim', :as => :recipient
    has_many :recieved_payments, :class_name => 'LedgerItems::Payment', :as => :recipient

    # attributes
    attr_accessible :description,
                    :is_self,
                    :name

    # validations
    validates :name, :presence => true

    def revenues
      recieved_payments
    end

    def expenses
      issued_payments
    end

    def account
      Account.new(revenues.map(&:to_account_item), expenses.map(&:to_account_item))
    end
  end
end
