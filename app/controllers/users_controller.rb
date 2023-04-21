class UsersController < ApplicationController
    skip_before_action :authorize, only: :create
    wrap_parameters format: []
    rescue_from ActionController::UnpermittedParameters, with: :handle_errors


  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    render json: user, status: :created
  end

  def show
    render json: @current_user
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end

  def handle_errors
    render json: { "Unpermitted Parameters found": params.to_unsafe_h.except(:controller, :action, :id, :name, :email, :password).keys }, status: :unprocessable_entity
end
end
