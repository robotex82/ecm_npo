module Ecm::Npo
  class Membership
    attr_accessor :begin_date, :end_date

    def initialize(begin_date, end_date = nil)
      @begin_date = begin_date
      @end_date = end_date
    end

    def active?
      active_at?(Time.zone.now)
    end

    def active_at?(point_in_time)
      begin_date < point_in_time && ( end_date.nil? || end_date > point_in_time )
    end

    def length
      return 1.0 / 0.0 if end_date.nil?
      end_date - begin_date
    end
  end
end

