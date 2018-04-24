class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :scope_current_user, if: :user_signed_in?

  def scope_current_user
    SimplCms.configure do |config|
      config.current_user = constructed_user
    end
  end

  private

  def constructed_user
    OpenStruct.new(my_email: current_user.email, my_2email: current_user.email)
  end
end
