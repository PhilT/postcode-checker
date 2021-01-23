# frozen_string_literal: true

require 'application_system_test_case'

class PostcodesTest < ApplicationSystemTestCase
  test 'Looking up a postcode' do
    visit postcodes_url

    # Firstly, slips on the keyboard
    fill_in 'Enter Postcode', with: 'SE1fsdfkj'
    click_on 'Check'

    assert_selector 'p', text: 'NOT ALLOWED'

    # Then enters correct valid postcode
    fill_in 'Enter Postcode', with: 'SE1 7QD'
    click_on 'Check'

    assert_selector 'p', text: 'ALLOWED'
  end
end
