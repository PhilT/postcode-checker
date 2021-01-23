# frozen_string_literal: true

require 'test_helper'

class PostcodeServiceTest < ActiveSupport::TestCase
  test 'returns :within when LSOA matches Southwark' do
    postcode = 'SE17QD'
    stub_request(:get, "https://api.postcodes.io/postcodes/#{postcode}")
      .to_return(status: 200, body: '{"result":{"lsoa":"Southwark 034A"}}')

    assert_equal :within, PostcodeService.new(postcode).lookup
  end

  test 'returns true when LSOA matches Lambeth' do
    postcode = 'SE17QA'
    stub_request(:get, "https://api.postcodes.io/postcodes/#{postcode}")
      .to_return(status: 200, body: '{"result":{"lsoa":"Lambeth 036"}}')

    assert_equal :within, PostcodeService.new(postcode).lookup
  end

  test 'returns false when LSOA matches Bracknell' do
    postcode = 'RG421AA'
    stub_request(:get, "https://api.postcodes.io/postcodes/#{postcode}")
      .to_return(status: 200, body: '{"result":{"lsoa":"Bracknell Forest 002C"}}')

    assert_equal :outside, PostcodeService.new(postcode).lookup
  end

  test 'returns invalid when LSOA does not match a postcode' do
    invalid_postcode = 'fdsfds'
    stub_request(:get, "https://api.postcodes.io/postcodes/#{invalid_postcode}")
      .to_return(status: 404, body: '{"status":404,"error":"Invalid postcode"}')

    assert_equal :invalid, PostcodeService.new(invalid_postcode).lookup
  end

  test 'returns not_available when service is unavailable' do
    postcode = 'SE17QD'
    stub_request(:get, "https://api.postcodes.io/postcodes/#{postcode}")
      .to_return(status: 503)

    assert_equal :unavailable, PostcodeService.new(postcode).lookup
  end
end
