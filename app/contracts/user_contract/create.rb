# frozen_string_literal: true

module UserContract
  class Create < ApplicationContract
    params do
      required(:email).filled(:string)
      required(:password).filled(:string)
      required(:password_confirmation).filled(:string)
      required(:first_name).filled(:string)
      optional(:last_name).filled(:string)
    end

    rule(:email) do
      key.failure('provide a valid email') unless /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i.match?(value)
    end

    rule(:password, :password_confirmation) do
      key.failure('do not match') unless values[:password].eql?(values[:password_confirmation])
    end
  end
end
