# frozen_string_literal: true

require 'test_helper'

class PostcodeTest < ActiveSupport::TestCase
  test 'allowed? returns true when postcode is in whitelist' do
    stub_request(:any, /api.postcodes.io/).to_raise('Not expecting to call API')

    assert Postcode.new(code: 'SH24 1AA').servable?
  end

  test 'santize postcode' do
    assert_equal 'SH241AA', Postcode.new(code: '(SH24 1AA)').code
  end

  test 'allowed? does not call API when postcode is blank' do
    stub_request(:any, /api.postcodes.io/).to_raise('Not expecting to call API')

    assert_nil Postcode.new(code: '').servable?
  end

  test 'allowed? does not call API when postcode has invalid characters' do
    stub_request(:any, /api.postcodes.io/).to_raise('Not expecting to call API')

    assert_nil Postcode.new(code: '()-=!"£$"').servable?
  end
end
