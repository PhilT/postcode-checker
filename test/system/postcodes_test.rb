# frozen_string_literal: true

require 'application_system_test_case'

class PostcodesTest < ApplicationSystemTestCase
  test 'Looking up a postcode' do
    visit postcodes_url

    fill_in 'Enter Postcode', with: 'SE1 7QD'
    click_on 'Check'

    assert_selector 'p', text: 'ALLOWED'
  end
end
