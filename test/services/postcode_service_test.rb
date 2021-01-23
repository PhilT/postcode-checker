# frozen_string_literal: true

require 'test_helper'

class PostcodeServiceTest < ActiveSupport::TestCase
  test 'allowed? returns true when LSOA matches Southwark' do
    stub_request(:get, 'https://api.postcodes.io/postcodes/SE17QD')
      .to_return(status: 200, body: '{"result":{"lsoa":"Southwark 034A"}}')

    assert PostcodeService.allowed?('SE1 7QD')
  end

  test 'allowed? returns true when LSOA matches Lambeth' do
    stub_request(:get, 'https://api.postcodes.io/postcodes/SE17QA')
      .to_return(status: 200, body: '{"result":{"lsoa":"Lambeth 036"}}')

    assert PostcodeService.allowed?('SE1 7QA')
  end

  test 'allowed? returns false when LSOA matches Bracknell' do
    stub_request(:get, 'https://api.postcodes.io/postcodes/RG421AA')
      .to_return(status: 200, body: '{"result":{"lsoa":"Bracknell Forest 002C"}}')

    assert_not PostcodeService.allowed?('RG42 1AA')
  end

  test 'allowed? returns false when LSOA does not match a postcode' do
    invalid_postcode = 'fdsfds'
    stub_request(:get, "https://api.postcodes.io/postcodes/#{invalid_postcode}")
      .to_return(status: 404, body: '{"status":404,"error":"Invalid postcode"}')

    assert_not PostcodeService.allowed?(invalid_postcode)
  end
end
