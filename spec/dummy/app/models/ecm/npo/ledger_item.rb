module Ecm::Npo
  class LedgerItem < ActiveRecord::Base
    # associations
    belongs_to :issuer, :polymorphic => true
    belongs_to :recipient, :polymorphic => true

    # attributes
    attr_accessible :currency,
                    :description,
                    :gross_amount,
                    :identifier,
                    :issued_at,
                    :issuer_id,
                    :issuer_type,
                    :recipient_id,
                    :recipient_type

    # citier
    acts_as_citier

    # money
    monetize :gross_amount_cents

    # validations
    validates :issued_at, :presence => true

    def to_account_item
      AccountItem.new(gross_amount)
    end
  end
end
