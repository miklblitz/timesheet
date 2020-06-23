# frozen_string_literal: true

# An exception handler
module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError do |e|
      logger.info e.message
      json_response({ message: e.message }, :unprocessable_entity)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      logger.info e.message
      json_response({ message: 'Not Found' }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      logger.info e.message
      json_response({ message: e.message }, :unprocessable_entity)
    end

  end
end
