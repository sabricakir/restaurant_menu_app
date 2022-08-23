module TurboHelper
  extend ActiveSupport::Concern

  included do
    before_action :set_variant

    helper_method :app_environment
    helper_method :app_environment_name
    helper_method :app_mobile?
    helper_method :app_mobile_ios?
    helper_method :app_mobile_android?
  end

  def app_mobile_ios?
    request&.user_agent&.include?(Rails.application.credentials[:ios_user_agent])
  end

  def app_mobile_android?
    request&.user_agent&.include?(Rails.application.credentials[:android_user_agent])
  end

  def app_mobile?
    app_mobile_ios? || app_mobile_android?
  end

  def app_environment_name
    if app_mobile_ios?
      'ios'
    elsif app_mobile_android?
      'android'
    else
      'web'
    end
  end

  def app_environment
    app_mobile? ? 'native' : 'web'
  end

  def set_variant
    request&.variant = :mobile if app_mobile?
  end
end