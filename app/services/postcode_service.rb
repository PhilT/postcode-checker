# frozen_string_literal: true

class PostcodeService
  def self.allowed?(code)
    service = Postcodes::IO.new
    response = service.lookup(code)
    return false unless response

    response.lsoa =~ /^Southwark |^Lambeth /
  end
end
