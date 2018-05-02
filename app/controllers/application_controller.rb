class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :scope_current_user,  if: :user_signed_in?
  before_action :scope_current_event, if: :user_signed_in?

  def scope_current_user
    SimplCms.configure do |config|
      config.current_user = constructed_user
    end
  end

  def scope_current_event
    if SimplCms.project_class.name.eql?('Event')
      SimplCms.configure do |config|
        config.current_project_id = current_event.id if current_event.present?
      end
    end
  end

  private

  # We could have different attributes in main app and in SimplCms engine,
  # therefore we can construct our own object for engine.
  def constructed_user
    OpenStruct.new(email: current_user.email)
  end

  def current_event
    return Event.last if Rails.env.eql?('development')

    if request.original_url.include?('admin') && !request.original_url.include?('isadminshow')
      Event.find(session[:xevent_event_id].to_i) rescue nil
    else
      Event.find_by_subdomain! request.subdomain rescue nil
    end
  end
end
