class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_request

  attr_reader :current_user
  helper_method :current_user

  private

  def authenticate_request
    @current_user = AuthenticateApiRequest.call(request.headers).result

    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
