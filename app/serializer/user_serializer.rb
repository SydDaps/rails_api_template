# frozen_string_literal: true

class UserSerializer < BaseSerializer
  def serialize_single
    {
      id: @data.id,
      first_name: @data.first_name,
      last_name: @data.last_name,
      email: @data.email
    }
  end
end
