# frozen_string_literal: true

require 'test_helper'

class PostcodeTest < ActiveSupport::TestCase
  test 'allowed? returns true when LSOA matches Southwark' do
    stub_request(:get, 'https://api.postcodes.io/postcodes/SE17QD')
      .to_return(status: 200, body: '{"result":{"lsoa":"Southwark 034A"}}')

    postcode = Postcode.new(code: 'SE1 7QD')
    assert postcode.allowed?
  end

  test 'allowed? returns true when LSOA matches Lambeth' do
    stub_request(:get, 'https://api.postcodes.io/postcodes/SE17QA')
      .to_return(status: 200, body: '{"result":{"lsoa":"Lambeth 036"}}')

    postcode = Postcode.new(code: 'SE1 7QA')
    assert postcode.allowed?
  end

  test 'allowed? returns false when LSOA matches Bracknell' do
    stub_request(:get, 'https://api.postcodes.io/postcodes/RG421AA')
      .to_return(status: 200, body: '{"result":{"lsoa":"Bracknell Forest 002C"}}')

    postcode = Postcode.new(code: 'RG42 1AA')
    assert_not postcode.allowed?
  end

  test 'allowed? returns true when postcode is in whitelist' do
    stub_request(:any, /api.postcodes.io/).to_raise('Not expecting to call API')

    postcode = Postcode.new(code: 'SH24 1AA')
    assert postcode.allowed?
  end

  test 'santize postcode' do
    assert_equal 'SH241AA', Postcode.new(code: '(SH24 1AA)').code
  end
end
