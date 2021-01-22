# frozen_string_literal: true

require 'test_helper'

class PostcodeCheckerTest < ActionDispatch::IntegrationTest
  test 'can see postcodes form' do
    get '/postcodes'
    assert_select 'h1', 'Postcode Lookup'
  end

  test 'lookup a servable postcode' do
    stub_request(:get, 'https://api.postcodes.io/postcodes/SE17QD')
      .to_return(status: 200, body: '{"result":{"lsoa":"Southwark 034A"}}')

    get '/postcodes', params: { code: 'SE1 7QD' }

    assert_response :success
    assert_select(
      'p',
      html: '<strong>ALLOWED</strong>: Postcode SE1 7QD is within our service area.'
    )
  end

  test 'lookup an unservable postcode' do
    stub_request(:get, 'https://api.postcodes.io/postcodes/RG421AA')
      .to_return(status: 200, body: '{"result":{"lsoa":"Bracknell Forest 002C"}}')

    get '/postcodes', params: { code: 'RG42 1AA' }

    assert_response :success
    assert_select(
      'p',
      html: '<strong>NOT ALLOWED</strong>: Postcode RG42 1AA is outside our service area.'
    )
  end
end
