# frozen_string_literal: true

class PostcodesController < ApplicationController
  def index
    return unless params[:code]

    @postcode = Postcode.new(params[:code])
    @status, @code = @postcode.lookup([WhitelistService, PostcodeService])
  end
end
