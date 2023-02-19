# frozen_string_literal: true

module UserService
  class Create < BaseService
    def initialize(user_attributes)
      @user_attributes = user_attributes
    end

    def call
      user = User.create!(@user_attributes)
      {user: UserSerializer.serialize(user)}
    end
  end
end
