# frozen_string_literal: true

module PostcodesHelper
  def self.standard_message(code, allowed, within)
    "<strong>#{allowed}</strong>: Postcode #{code} is #{within} our service area.".html_safe
  end

  def self.display_servable_for(code, reason)
    return unless code

    {
      within: standard_message(code, 'ALLOWED', 'within'),
      outside: standard_message(code, 'NOT ALLOWED', 'outside'),
      invalid: 'Enter a valid postcode to check.',
      nil => ''
    }[reason]
  end
end
