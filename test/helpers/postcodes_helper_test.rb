# frozen_string_literal: true

require 'test_helper'

class PostcodesHelperTest < ActiveSupport::TestCase
  test 'display_servable_for returns allowed message' do
    result = PostcodesHelper.display_servable_for 'SE1 7QD', true

    assert_equal '<strong>ALLOWED</strong>: Postcode SE1 7QD is within our service area.', result
  end

  test 'display_servable_for returns not allowed message' do
    result = PostcodesHelper.display_servable_for 'SE1 7QD', false

    assert_equal '<strong>NOT ALLOWED</strong>: Postcode SE1 7QD is outside our service area.', result
  end
end
