# frozen_string_literal: true

class TestsController < ApplicationController
  def index
    render json: { status: 300 }, status: :multiple_choices
  end
end
