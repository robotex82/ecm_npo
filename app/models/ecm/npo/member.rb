module Ecm::Npo
  class Member < ActiveRecord::Base
    # associations
    belongs_to :user
    has_many :membership_begins, :class_name => 'EventDocuments::MembershipBegin'
    has_many :membership_ends, :class_name => 'EventDocuments::MembershipEnd'
    has_many :membership_fees, :class_name => 'LedgerItems::Claims::MembershipFee'
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

    def active?
      memberships.map(&:active?).include?(true)
    end

    def age
      if (Time.zone.now.month < birthdate.month) || (Time.zone.now.month == birthdate.month && birthdate.day > Time.zone.now.day)
        Time.zone.now.year - birthdate.year - 1
      else
        Time.zone.now.year - birthdate.year
      end
    end 

    def memberships
      membership_begins.map(&:to_membership)
    end

    def to_s
      "#{firstname} #{lastname}"
    end
  end
end

