## Islington Council Tax Payment Script

Islington Council accepts council tax payment online with credit cards. I like getting airline miles, but I am also very lazy, so I automated this.

#### Environment variables

You will need to set the following environment variables in your .bashrc (or .zshrc if you use zsh). Replace everything inside and including the <>:

```
export REF_NUMBER=<your reference number>
export PAYMENT_AMOUNT=<your monthly payment amount>
export CARD_NUMBER=<your credit card number>
export EXP_DATE=<your expiration date, in the format MMYY>
export CARD_HOLDER_NAME=<name on your card>
export SEC_CODE=<security code>
export PHONE_NUMBER=<phone number>
export EMAIL=<email>
```

#### Dependencies

Ruby, Bundler, Selenium webdriver, Chrome or Firefox

#### How to run

```
git clone git@github.com:deniseyu/council-tax-payment-script.git
cd council-tax-payment-script
bundle install
```

Uncomment line 43 of spec/tax_spec.rb, then run `rspec`.

#### Using Firefox

You can tell Selenium webdriver to run Firefox instead of Chrome. In line 12 just change `Capybara::Selenium::Driver.new(:browser => :chrome)` to `      Capybara::Selenium::Driver.new(:browser => :firefox)`. Don't ask me about Internet Explorer.

#### Disclaimer

This is extremely brittle and won't work if Islington Council decides to change their HTML. If that happens open a PR!
