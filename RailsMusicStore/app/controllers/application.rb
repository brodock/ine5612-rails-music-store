# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_RailsMusicStore_session_id'
  layout 'musicstore'
  
  before_filter :fetch_logged_in_user

  protected
  def fetch_logged_in_user
    return if session[:user_id].blank?
    @current_user = User.find_by_id(session[:user_id])
  end
  
#  protected
#  def authenticate
#    unless session["user"]
#      redirect_to :controller => 'users', :action => 'login'
#      return false
#    end
#  end
end
