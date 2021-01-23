# frozen_string_literal: true

require_relative '../../lib/sanitize'

class Whitelist
  def self.load
    File.read(Rails.root.join('config/whitelist.txt'))
  end

  def self.to_h(whitelist)
    whitelist
      .split("\n")
      .map { |code| [Sanitize.postcode(code), code] }
      .to_h
  end

  @whitelist = Whitelist.to_h Whitelist.load
  class << self
    attr_reader :whitelist
  end

  attr_reader :code, :formatted

  def found? = @found

  def initialize(code)
    @code = Sanitize.postcode(code)
    @found = self.class.whitelist.include?(@code)
    @formatted = self.class.whitelist[@code]
  end
end
