class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  private
  def current_client
    puts 184721941241278648126846126848124841
    puts cookies[:client_id]
    @current_client ||= Client.find(cookies[:client_id]) if cookies[:client_id] != nil
  end
  def redirect_to_face
    if current_client == nil
      redirect_to "/auth/facebook/"
    end
  end
  helper_method :current_client
  helper_method :redirect_to_face
end
