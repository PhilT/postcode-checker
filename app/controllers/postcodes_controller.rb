# frozen_string_literal: true

class PostcodesController < ApplicationController
  def index
    return unless params[:code]

    @postcode = Postcode.new(code: params[:code])
    @code = @postcode.code
    @allowed = @postcode.allowed?
  end
end
