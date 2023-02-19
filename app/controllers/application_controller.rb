# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authorize_request
  include ErrorHandler

  def authorize_request
    @user = AuthService::Authorize.call(request.headers)
  end

  def validate_params(contract, params)
    params = contract.call(params)
    return params.to_h if params.errors.blank?

    error_message = params.errors(full: true).messages.to_sentence

    raise ApiException::InvalidParameter, error_message
  end
end
