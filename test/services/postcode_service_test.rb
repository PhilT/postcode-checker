# frozen_string_literal: true

require 'test_helper'

class PostcodeServiceTest < ActiveSupport::TestCase
  test 'returns :within when LSOA matches Southwark' do
    postcode = 'SE17QD'
    stub_request(:get, "https://api.postcodes.io/postcodes/#{postcode}")
      .to_return(status: 200, body: '{"result":{"lsoa":"Southwark 034A","postcode":"SE1 7QD"}}')

    assert_equal [:within, 'SE1 7QD'], PostcodeService.lookup(postcode)
  end

  test 'returns true when LSOA matches Lambeth' do
    postcode = 'SE17QA'
    stub_request(:get, "https://api.postcodes.io/postcodes/#{postcode}")
      .to_return(status: 200, body: '{"result":{"lsoa":"Lambeth 036","postcode":"SE1 7QA"}}')

    assert_equal [:within, 'SE1 7QA'], PostcodeService.lookup(postcode)
  end

  test 'returns false when LSOA matches Bracknell' do
    postcode = 'RG421AA'
    stub_request(:get, "https://api.postcodes.io/postcodes/#{postcode}")
      .to_return(
        status: 200,
        body: '{"result":{"lsoa":"Bracknell Forest 002C","postcode":"RG42 1AA"}}'
      )

    assert_equal [:outside, 'RG42 1AA'], PostcodeService.lookup(postcode)
  end

  test 'returns invalid when LSOA does not match a postcode' do
    invalid_postcode = 'fdsfds'
    stub_request(:get, "https://api.postcodes.io/postcodes/#{invalid_postcode}")
      .to_return(status: 404, body: '{"status":404,"error":"Invalid postcode"}')

    assert_equal [:invalid, invalid_postcode], PostcodeService.lookup(invalid_postcode)
  end

  test 'returns not_available when service is unavailable' do
    postcode = 'SE17QD'
    stub_request(:get, "https://api.postcodes.io/postcodes/#{postcode}")
      .to_return(status: 503)

    assert_equal [:unavailable, postcode], PostcodeService.lookup(postcode)
  end

  test 'sets formatted to the correct form of the postcode' do
    postcode = 'SE17QA'
    stub_request(:get, "https://api.postcodes.io/postcodes/#{postcode}")
      .to_return(status: 200, body: '{"result":{"lsoa":"Lambeth 036","postcode":"SE1 7QA"}}')

    assert_equal [:within, 'SE1 7QA'], PostcodeService.lookup(postcode)
  end
end
