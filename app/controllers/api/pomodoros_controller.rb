class API::PomodorosController < ApplicationController
  def index
    @pomodoros = Pomodoro.all
  end

  def show
    @pomodoro = Pomodoro.find(params[:id])
  end

  def create
    @pomodoro = Pomodoro.new(pomodoro_params)
    if @pomodoro.save
      render json: @pomodoro, status: :created
    else
      render json: @pomodoro.errors, status: :unprocessable_entity
    end
  end

  private

  def pomodoro_params
    params.require(:pomodoro).permit(:start, :end)
  end
end
