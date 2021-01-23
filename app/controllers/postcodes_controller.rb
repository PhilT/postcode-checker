# frozen_string_literal: true

class PostcodesController < ApplicationController
  def index
    return unless params[:code]

    @postcode = Postcode.new(params[:code])
    @code = @postcode.code
    @status = @postcode.lookup([WhitelistService, PostcodeService])
  end
end
