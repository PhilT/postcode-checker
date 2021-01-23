# frozen_string_literal: true

require 'test_helper'

class WhitelistTest < ActiveSupport::TestCase
  test 'loads whitelist' do
    assert_equal 'SH24 1AA', Whitelist.whitelist['SH241AA']
  end

  test 'sanitizes postcode' do
    subject = Whitelist.new('sh24 1aa')
    assert_equal 'SH241AA', subject.code
  end

  test 'finds postcode' do
    subject = Whitelist.new('sh24 1aa')
    assert subject.found?
  end

  test 'returns formatted postcode' do
    subject = Whitelist.new('sh24 1aa')
    subject.found?
    assert_equal 'SH24 1AA', subject.formatted
  end
end
