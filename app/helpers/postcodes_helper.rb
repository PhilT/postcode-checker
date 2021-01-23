# frozen_string_literal: true

module PostcodesHelper
  def self.display_servable_for(code, servable)
    return unless code
    return 'Enter a valid postcode to check.' unless code.present?

    allowed, within = if servable
                        %w[ALLOWED within]
                      else
                        ['NOT ALLOWED', 'outside']
                      end
    "<strong>#{allowed}</strong>: Postcode #{code} is #{within} our service area.".html_safe
  end
end
