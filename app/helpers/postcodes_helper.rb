# frozen_string_literal: true

module PostcodesHelper
  def self.display_servable_for(code, allowed)
    return unless code

    allowed, within = if allowed
                        %w[ALLOWED within]
                      else
                        ['NOT ALLOWED', 'outside']
                      end
    "<strong>#{allowed}</strong>: Postcode #{code} is #{within} our service area.".html_safe

  end
end
