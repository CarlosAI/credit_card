# Credit Card Processor

This is a simple Ruby script that handles basic credit card processing tasks such as adding new accounts, charging, and crediting.

## Design Overview

The program is structured into two main classes:

1. `CreditCard`: Represents a credit card account with a card number, a limit, and a balance. It provides methods for validating the card number using the Luhn algorithm, charging the card, and crediting the card.

2. `CreditCardProcessor`: Manages multiple `CreditCard` objects. It can add new cards, charge existing cards, and credit existing cards. It also generates a summary of all card balances.

Both classes are covered with unit tests using RSpec.

## Language Selection

Ruby was selected as the programming language for this project due to my 5 years of experience with it. I'm comfortable with Ruby and it allows for rapid development and easy testing. However, the principles used in this project could be applied in any object-oriented language.

## Dependencies

This project requires the RSpec testing library to run the tests. To install RSpec, you can use the following command:

```bash
gem install rspec
```

## Building and Running

There is no need to build or compile the code as Ruby is an interpreted language. 

To run the main program, use the following command (replacing `input.txt` with your input file):

ruby credit_card_manager.rb input.txt


To run the tests, navigate to the project directory in your terminal and use the following command:

```bash
rspec spec
```

## Tests

Tests are located in the `spec` directory and can be run with the `rspec` command as shown above. The tests cover all the main functionality of the `CreditCard` and `CreditCardProcessor` classes.
