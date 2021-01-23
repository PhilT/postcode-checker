# frozen_string_literal: true

require 'test_helper'

class WhitelistServiceTest < ActiveSupport::TestCase
  test 'loads whitelist' do
    assert_equal 'SH24 1AA', WhitelistService.whitelist['SH241AA']
  end

  test 'finds postcode with formatted code' do
    assert_equal [:within, 'SH24 1AA'], WhitelistService.lookup('SH241AA')
  end

  test 'does not find postcode' do
    assert_equal [:outside, 'RG421AA'], WhitelistService.lookup('RG421AA')
  end
end
