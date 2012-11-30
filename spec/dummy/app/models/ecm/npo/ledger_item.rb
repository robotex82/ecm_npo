class Ecm::Npo::LedgerItem < ActiveRecord::Base
  # associations
  belongs_to :issuer, :polymorphic => true
  belongs_to :recipient, :polymorphic => true

  # attributes
  attr_accessible :description,
                  :gross_amount_cents,
                  :gross_amount_currency,
                  :identifier,
                  :issued_at,
                  :issuer_id,
                  :issuer_type,
                  :recipient_id,
                  :recipient_type

  # citier
  acts_as_citier

  # validations
  validates :issued_at, :presence => true
end
