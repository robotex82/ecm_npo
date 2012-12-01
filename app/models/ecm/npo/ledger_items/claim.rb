module Ecm::Npo
  class LedgerItems::Claim < LedgerItem
    # associations
    has_many :payments, :class_name => 'Ecm::Npo::LedgerItems::Payment'

    def paid?
      payment_gross_amount_sum >= gross_amount
    end

    def payment_gross_amount_sum
      payments.map(&:gross_amount).reduce(Money.new(0)) { |sum, payment| sum += payment }
    end

    def to_s
      "#{issuer} => #{recipient} #{I18n.l(issued_at.to_date)}: #{gross_amount} #{gross_amount.currency}"
    end
  end
end
