class UsersController < ApplicationController
  def create
    user = User.new(full_name: params[:full_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

    # happy/sad paths
    if user.save
      render json: { message: "User created successfully!" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    user = User.find_by(id: params[:id])

    user.full_name = params[:full_name] || user.full_name
    user.email = params[:email] || user.email
    user.password = params[:password] || user.password
    user.password_confirmation = params[:password_confirmation] || user.password_confirmation

    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end

  # def destroy
  #   user = User.find_by(id: params[:id])
  #   user.destroy
  #   render json: { message: "Account deleted successfully." }
  # end
end
