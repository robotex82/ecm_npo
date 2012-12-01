module Ecm::Npo
  class Member < ActiveRecord::Base
    # associations
    belongs_to :user
    has_many :membership_begins, :class_name => 'EventDocuments::MembershipBegin'
    has_many :membership_ends, :class_name => 'EventDocuments::MembershipEnd'
    has_many :issued_claims, :class_name => 'LedgerItems::Claim', :as => :issuer
    has_many :issued_payments, :class_name => 'LedgerItems::Payment', :as => :issuer
    has_many :recieved_claims, :class_name => 'LedgerItems::Claim', :as => :recipient
    has_many :recieved_payments, :class_name => 'LedgerItems::Payment', :as => :recipient

    # attributes
    attr_accessible :birthdate,
                    :firstname,
                    :lastname,
                    :nickname,
                    :slug,
                    :user_id

    # validations
    validates :birthdate, :presence => true
    validates :firstname, :presence => true
    validates :lastname, :presence => true

    def revenues
      recieved_payments
    end

    def expenses
      issued_payments
    end

    def account
      Account.new(revenues.map(&:to_account_item), expenses.map(&:to_account_item))
    end

    def account_balance
      account.balance
    end

    def memberships
      membership_begins.map(&:to_membership)
    end

    def to_s
      "#{firstname} #{lastname}"
    end
  end
end

