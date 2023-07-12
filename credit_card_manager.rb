require_relative 'credit_card'
require_relative 'credit_card_processor'

def process_input(processor, input)
  data = input.split
  command = data[0].downcase

  case command
  when 'add'
    name, card_number, limit = data[1..3]
    limit.gsub!("$", "")
    processor.add_card(name, card_number, limit.to_i)
  when 'charge'
    name, amount = data[1..2]
    amount.gsub!("$", "")
    processor.charge(name, amount.to_i)
  when 'credit'
    name, amount = data[1..2]
    amount.gsub!("$", "")
    processor.credit(name, amount.to_i)
  end
end

processor = CreditCardProcessor.new

ARGF.each_line do |line|
  process_input(processor, line)
end

puts processor.generate_summary
