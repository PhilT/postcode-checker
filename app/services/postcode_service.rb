# frozen_string_literal: true

require 'net/http'
require 'json'

class PostcodeService
  POSTCODES_IO_BASE_URI = 'https://api.postcodes.io/postcodes/'

  def self.allowed?(code)
    response = Net::HTTP.get(URI("#{POSTCODES_IO_BASE_URI}#{code}"))
    json_response = JSON.parse(response)

    return false unless json_response['error'].blank?

    json_response['result']['lsoa'] =~ /^Southwark |^Lambeth /
  end
end
