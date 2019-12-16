class Oystercard

    attr_reader :balance, :entry_station

    MAX_LIMIT = 90
    MIN_LIMIT = 1
    MIN_FARE = 2

    def initialize(balance = 0)
        @balance = balance
        @entry_station = nil
    end

    def top_up(value)
        fail "Error: Maximum limit of #{MAX_LIMIT.to_s} reached" if exceeds_max?(value)
        @balance += value
    end

    def in_journey?
      @entry_station != nil
    end

    def touch_in(location)
      fail "Not enough credit" if min_amount?
      @entry_station = location
    end

    def touch_out
      deduct(MIN_FARE)
      @entry_station = nil
    end

    private

    def exceeds_max?(value)
      @balance + value >= MAX_LIMIT
    end

    def min_amount?
      @balance <= MIN_LIMIT
    end

    def deduct(value)
      @balance -= value
    end
end
