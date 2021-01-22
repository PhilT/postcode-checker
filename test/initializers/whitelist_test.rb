# frozen_string_literal: true

class WhitelistTest < ActiveSupport::TestCase
  test 'loads whitelist' do
    assert Whitelist.include?('SH241AA')
    assert Whitelist.include?('SH241AB')
  end
end
