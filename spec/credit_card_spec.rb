require_relative '../credit_card'

RSpec.describe CreditCard do
  let(:card) { CreditCard.new("4111111111111111", 1000) }

  it "validates luhn 10 correctly" do
    expect(card.luhn_valid?).to be true
    card.card_number = "1234567890123456"
    expect(card.luhn_valid?).to be false
  end

  it "charges correctly" do
    card.charge(500)
    expect(card.balance).to eq(500)
    card.charge(800) # this would exceed the limit
    expect(card.balance).to eq(500) # balance should remain same as limit was exceeded
  end

  it "credits correctly" do
    card.credit(200)
    expect(card.balance).to eq(-200)
  end
end
