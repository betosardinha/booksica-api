# frozen_string_literal: true

Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.base_controller_class = 'ActionController::API'
  config.lograge.formatter = Lograge::Formatters::Json.new
  config.colorize_logging = false

  config.lograge.custom_options = lambda do |event|
    {
      rails_env: Rails.env,
      timestamp: Time.current,
      params: event.payload[:params].except('controller', 'action', 'utf8', 'format', 'id'),
      level: event.payload[:level],
      host: event.payload[:host],
      remote_ip: event.payload[:remote_ip],
      ip: event.payload[:ip],
      x_forwarded_for: event.payload[:x_forwarded_for],
      current_user_id: event.payload[:current_user_id],
      request_id: event.payload[:request_id]
    }.compact
  end
end
