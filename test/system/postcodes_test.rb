# frozen_string_literal: true

require 'application_system_test_case'

class PostcodesTest < ApplicationSystemTestCase
  test 'Looking up a postcode' do
    visit postcodes_url

    # Firstly, slips on the keyboard
    fill_in 'Enter Postcode', with: 'SE1fsdfkj'
    click_on 'Check'

    assert_selector 'p', text: 'Enter a valid postcode to check'

    # Clears the form
    click_on 'Clear'

    assert_no_text 'Enter a valid postcode to check'

    # Then enters correct valid postcode
    fill_in 'Enter Postcode', with: 'SE1 7QD'
    click_on 'Check'

    assert_selector 'p', text: 'ALLOWED'
  end
end
