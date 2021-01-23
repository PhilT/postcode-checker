# frozen_string_literal: true

require 'test_helper'

class PostcodesHelperTest < ActiveSupport::TestCase
  test 'display_servable_for initiallly returns no message' do
    result = PostcodesHelper.display_servable_for nil, nil
    assert_nil result
  end

  test 'display_servable_for returns allowed message' do
    result = PostcodesHelper.display_servable_for 'SE1 7QD', :within

    assert_equal '<strong>ALLOWED</strong>: Postcode SE1 7QD is within our service area.', result
  end

  test 'display_servable_for returns not allowed message' do
    result = PostcodesHelper.display_servable_for 'SE1 7QD', :outside

    assert_equal '<strong>NOT ALLOWED</strong>: Postcode SE1 7QD is outside our service area.',
                 result
  end

  test 'display_servable_for returns Enter postcode message when invalid' do
    result = PostcodesHelper.display_servable_for '', :invalid

    assert_equal 'Enter a valid postcode to check.', result
  end

  test 'display_servable_for returns service unavailable message' do
    result = PostcodesHelper.display_servable_for 'SE1 7QD', :unavailable

    assert_equal 'The postcode service is currently unavailable. Please try later.', result
  end
end
