# frozen_string_literal: true

require 'net/http'
require 'json'

class PostcodeService
  POSTCODES_IO_BASE_URI = 'https://api.postcodes.io/postcodes/'

  attr_reader :reason

  def initialize(code)
    @code = code
  end

  def allowed?
    response = Net::HTTP.get_response(URI("#{POSTCODES_IO_BASE_URI}#{@code}"))

    if response.code == '200'
      json_response = JSON.parse(response.body)
      allowed = json_response['result']['lsoa'] =~ /^Southwark |^Lambeth /
      @reason = allowed ? :within : :outside
      allowed
    else
      @reason = response.code == '404' ? :invalid : :unavailable
      false
    end
  end
end
