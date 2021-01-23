# frozen_string_literal: true

require 'test_helper'

class PostcodeTest < ActiveSupport::TestCase
  class ProviderReturningWithin
    def initialize(code) = @code = code

    def lookup = :within
  end

  class ProviderReturningOutside
    def initialize(code) = @code = code

    def lookup = :outside
  end

  class ProviderReturningInvalid
    def initialize(code) = @code = code

    def lookup = :invalid
  end

  test 'sets status of last provider' do
    subject = Postcode.new(code: '123')
    status = subject.lookup([ProviderReturningOutside, ProviderReturningInvalid])

    assert_equal :invalid, status
  end

  test 'calls providers until one returns within' do
    subject = Postcode.new(code: '123')
    status = subject.lookup([ProviderReturningWithin, ProviderReturningOutside])
    assert_equal :within, status
  end

  test 'returns when code is nil' do
    assert_nil Postcode.new(code: nil).lookup(nil)
  end

  test 'sets status invalid when code is empty' do
    assert_equal :invalid, Postcode.new(code: '').lookup(nil)
  end

  test 'sets status invalid when postcode has invalid characters' do
    assert_equal :invalid, Postcode.new(code: '()-=!"£$"').lookup(nil)
  end
end
