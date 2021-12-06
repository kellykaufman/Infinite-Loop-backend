class AnxietiesController < ApplicationController
  def index
    anxiety = Anxiety.all
    render json: anxiety
  end

  def create
    anxiety = Anxiety.new(life_theme: params[:life_theme], intrusive_thought_or_feeling: params[:intrusive_thought_or_feeling], anxiety_theme: params[:anxiety_theme], opposite_action: params[:opposite_action], timer: params[:timer], progress: params[:progress])

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

    if anxiety.save
      render json: anxiety
    else
      render json: { errors: anxiety.errors.full_messages }, status: 422
    end
  end
end
