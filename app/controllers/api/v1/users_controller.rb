# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authorize_request

      def create
        user_params = validate_params(UserContract::Create, params.permit!.to_h)

        user_data = UserService::Create.call(user_params)

        render ApiResponse.send(200, user_data)
      end
    end
  end
end
