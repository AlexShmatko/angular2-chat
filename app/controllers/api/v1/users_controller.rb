class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: :create

  expose :user

  def create
    user = User.create(user_params)
    if user.save
      render json: user, status: :accepted
    else
      render json: { status: :error, errors: user.errors.messages }, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :token, :password, :password_confirmation)
  end
end
