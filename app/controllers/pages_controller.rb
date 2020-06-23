# frozen_string_literal: true

# An Pages Controller
class PagesController < ApplicationController
  skip_before_action :authorize_request
  
  def index
    json_response(
      message: 'You are welcome to API REST service',
      version: '0.0.1',
      env: Rails.env
    )
  end
end
