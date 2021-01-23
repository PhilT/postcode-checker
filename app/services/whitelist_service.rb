# frozen_string_literal: true

require_relative '../../lib/sanitize'

class WhitelistService
  def self.load
    File.read(Rails.root.join('config/whitelist.txt'))
  end

  def self.to_h(whitelist)
    whitelist
      .split("\n")
      .map { |code| [Sanitize.postcode(code), code] }
      .to_h
  end

  @whitelist = WhitelistService.to_h WhitelistService.load
  class << self
    attr_reader :whitelist
  end

  attr_reader :code, :formatted, :status

  def initialize(sanitized_code)
    @code = sanitized_code
  end

  def lookup
    @formatted = self.class.whitelist[@code]
    @status = @formatted ? :within : :outside
  end
end
