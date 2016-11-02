class Api::V1::BaseController < ActionController::API
  include ActionController::Helpers
  before_action :authenticate_user!

  expose :current_user, lambda {
    token = request.headers['Authorization'].to_s.split(' ').last
    User.find_by(token: token) if token
  }

  def authenticate_user!
    head(:unathorized) unless current_user
  end
end
