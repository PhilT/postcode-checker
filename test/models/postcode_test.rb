# frozen_string_literal: true

require 'test_helper'

class PostcodeTest < ActiveSupport::TestCase
  class ProviderReturningWithin
    def self.lookup(_code) = [:within, 'formatted']
  end

  class ProviderReturningOutside
    def self.lookup(_code) = [:outside, 'formatted']
  end

  class ProviderReturningInvalid
    def self.lookup(_code) = [:invalid, '']
  end

  test 'sets status of last provider' do
    subject = Postcode.new('123')
    result = subject.lookup([ProviderReturningOutside, ProviderReturningInvalid])

    assert_equal [:invalid, ''], result
  end

  test 'calls providers until one returns within' do
    subject = Postcode.new('123')
    result = subject.lookup([ProviderReturningWithin, ProviderReturningOutside])

    assert_equal [:within, 'formatted'], result
  end

  test 'returns when code is nil' do
    assert_equal [nil, nil], Postcode.new(nil).lookup(nil)
  end

  test 'sets status invalid when code is empty' do
    assert_equal [:invalid, ''], Postcode.new('').lookup(nil)
  end

  test 'sets status invalid when postcode has invalid characters' do
    assert_equal [:invalid, ''], Postcode.new('()-=!"£$"').lookup(nil)
  end
end
