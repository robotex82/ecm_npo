module Ecm::Npo
  class Account
    attr_accessor :balance, :expenses, :revenues

    def initialize(revenues, expenses)
      @revenues = revenues
      @expenses = expenses
    end

    def balance
      total_revenues - total_expenses      
    end

    def total_expenses
      expenses.
        map(&:amount).
          inject(Money.new(0)) { |sum, amount| amount + sum }
    end

    def total_revenues
      revenues.
        map(&:amount).
          inject(Money.new(0)) { |sum, amount| amount + sum }
    end
  end
end
