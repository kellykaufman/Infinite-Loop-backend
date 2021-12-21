class AnxietiesController < ApplicationController
  before_action :authenticate_user

  def index
    user = User.find_by(id: current_user.id)
    anxieties = user.anxieties.order(created_at: :desc)
    render json: anxieties
  end

  def show
    anxieties = Anxiety.find_by(id: params[:id])
    render json: anxieties
  end

  def create
    anxiety = Anxiety.new(
      life_theme: params[:life_theme],
      intrusive_thought_or_feeling: params[:intrusive_thought_or_feeling],
      anxiety_theme: params[:anxiety_theme],
      opposite_action: params[:opposite_action],
      timer: params[:timer],
      progress: params[:progress],
      user_id: current_user.id,
    )

    if anxiety.save
      render json: anxiety, status: :created
    else
      render json: { errors: anxiety.errors.full_messages }, status: 422
    end
  end

  def update
    anxiety = Anxiety.find_by(id: params[:id])

    anxiety.life_theme = params[:life_theme] || anxiety.life_theme
    anxiety.intrusive_thought_or_feeling = params[:intrusive_thought_or_feeling] || anxiety.intrusive_thought_or_feeling
    anxiety.anxiety_theme = params[:anxiety_theme] || anxiety.anxiety_theme
    anxiety.opposite_action = params[:opposite_action] || anxiety.opposite_action
    anxiety.timer = params[:timer] || anxiety.timer
    anxiety.progress = params[:progress] || anxiety.progress
    anxiety.user_id = current_user.id || anxiety.user_id

    if anxiety.save
      render json: anxiety
    else
      render json: { errors: anxiety.errors.full_messages }, status: 422
    end
  end

  def destroy
    anxiety = Anxiety.find_by(id: params[:id])

    anxiety.delete
    render json: { message: "Anxiety deleted." }
  end
end
