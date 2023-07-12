class CreditCardProcessor
  attr_accessor :cards

  def initialize
    @cards = {}
  end

  def add_card(name, card_number, limit)
    @cards[name] = CreditCard.new(card_number, limit)
  end

  def charge(name, amount)
    card = @cards[name]
    card.charge(amount.to_i) if card&.luhn_valid?
  end

  def credit(name, amount)
    card = @cards[name]
    card.credit(amount.to_i) if card&.luhn_valid?
  end

  def generate_summary
    @cards.sort.map do |name, card|
      balance = card.luhn_valid? ? card.balance : "error"
      "#{name}: $#{balance}"
    end.join("\n")
  end
end
