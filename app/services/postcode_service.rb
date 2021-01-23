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
    response = Net::HTTP.get(URI("#{POSTCODES_IO_BASE_URI}#{@code}"))
    json_response = JSON.parse(response)

    if json_response['error'].present?
      @reason = :invalid
      false
    else
      allowed = json_response['result']['lsoa'] =~ /^Southwark |^Lambeth /
      @reason = allowed ? :within : :outside
      allowed
    end
  end
end
