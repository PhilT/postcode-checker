# frozen_string_literal: true

require 'test_helper'

class WhitelistServiceTest < ActiveSupport::TestCase
  test 'loads whitelist' do
    assert_equal 'SH24 1AA', WhitelistService.whitelist['SH241AA']
  end

  test 'finds postcode' do
    assert_equal :within, WhitelistService.new('SH241AA').lookup
  end

  test 'does not find postcode' do
    assert_equal :outside, WhitelistService.new('RG421AA').lookup
  end

  test 'returns formatted postcode' do
    subject = WhitelistService.new('SH241AA')
    subject.lookup
    assert_equal 'SH24 1AA', subject.formatted
  end
end
