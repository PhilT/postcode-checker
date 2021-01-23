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

  def self.lookup(sanitized_code)
    formatted = whitelist[sanitized_code]
    [formatted ? :within : :outside, formatted || sanitized_code]
  end
end
