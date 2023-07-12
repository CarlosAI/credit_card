require_relative '../credit_card'
require_relative '../credit_card_processor'

RSpec.describe CreditCardProcessor do
  let(:processor) { CreditCardProcessor.new }

  it "adds cards correctly" do
    processor.add_card("Tom", "4111111111111111", 1000)
    expect(processor.cards["Tom"]).to be_a(CreditCard)
  end

  it "charges correctly" do
    processor.add_card("Tom", "4111111111111111", 1000)
    processor.charge("Tom", 500)
    expect(processor.cards["Tom"].balance).to eq(500)
  end

  it "credits correctly" do
    processor.add_card("Tom", "4111111111111111", 1000)
    processor.credit("Tom", 200)
    expect(processor.cards["Tom"].balance).to eq(-200)
  end

  it "generates summary correctly" do
    processor.add_card("Tom", "4111111111111111", 1000)
    processor.add_card("Lisa", "5454545454545454", 3000)
    processor.add_card("Quincy", "1234567890123456", 2000)
    processor.charge("Tom", 500)
    processor.charge("Tom", 800)
    processor.charge("Lisa", 7)
    processor.credit("Lisa", 100)
    processor.credit("Quincy", 200)
    expect(processor.generate_summary).to eq("Lisa: $-93\nQuincy: $error\nTom: $500")
  end
end
