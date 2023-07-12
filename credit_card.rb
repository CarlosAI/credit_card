class CreditCard
  attr_accessor :card_number, :balance, :limit

  def initialize(card_number, limit)
    @card_number = card_number
    @limit = limit.to_i
    @balance = 0
  end

  def luhn_valid?
    digits = @card_number.to_s.reverse.chars.map(&:to_i)
    check_sum = digits.each_slice(2).flat_map do |x, y|
      [x, (y || 0) * 2].flatten.map { |d| d > 9 ? d - 9 : d }
    end.sum
    (check_sum % 10).zero?
  end

  def charge(amount)
    new_balance = @balance + amount
    @balance = new_balance if new_balance <= @limit
  end

  def credit(amount)
    @balance -= amount
  end
end
