# frozen_string_literal: true

require 'application_system_test_case'

class LookupsTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit lookups_url

    assert_selector 'h1', text: 'Postcode Lookup'
  end
end
