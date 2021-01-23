# frozen_string_literal: true

require 'test_helper'
require_relative '../../lib/sanitize'

class SanitizeTest < ActiveSupport::TestCase
  test 'santize postcode' do
    assert_equal 'SH241AA', Sanitize.postcode('SH24 1AA')
    assert_equal 'SH241AA', Sanitize.postcode('SH241AA')
    assert_equal 'SH241AA', Sanitize.postcode('sh24 1aA')
    assert_equal 'SH241AA', Sanitize.postcode('sh24-1aa')
    assert_equal 'SH241AA', Sanitize.postcode('SH24   1AA ')
    assert_equal 'SH241AA', Sanitize.postcode('(SH24 1AA)')
  end
end
