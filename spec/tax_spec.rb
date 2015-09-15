require 'spec_helper'

def click_to_next_page
  within '#buttonpanel' do
    find('.primarybutton').click
  end
end

feature 'Paying my council tax from command line' do
  before(:each) do
    Capybara.register_driver :selenium do
      Capybara::Selenium::Driver.new(:browser => :chrome)
    end
    Capybara.current_driver = :selenium
  end

  it 'pays my council tax' do
    visit 'http://www.islington.gov.uk/paycounciltax'
    find('input#field-number-1').set(ENV['REF_NUMBER'])
    find('input#field-number-2').set(ENV['PAYMENT_AMOUNT'])
    find('#processpage').click

    within '#page-column-two' do
      page.all('a')[1].click
    end

    find('input#cardnumber').set(ENV['CARD_NUMBER'])
    find('input#cardname').set(ENV['CARD_HOLDER_NAME'])
    find('input#expiresend').set(ENV['EXP_DATE'])

    click_to_next_page

    find('#securitycode').set(ENV['SEC_CODE'])

    click_to_next_page

    find('#emailaddress').set(ENV['EMAIL'])
    find('#phonenumber').set(ENV['PHONE_NUMBER'])

    click_to_next_page

    # THIS ACTUALLY SENDS CREDIT CARD PAYMENT
    # find('#action_process').click
  end
end
