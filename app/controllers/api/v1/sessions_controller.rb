class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: :create

  expose :user, -> { User.find_by(email: params[:email]) }

  def create
    return render json: user.generate_new_token!, status: :created if user && user.authenticate(params[:password])
    head(:unprocessable_entity)
  end
end
