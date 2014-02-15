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
      render json: @pomdoro, status: :created
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  private

  def pomodoro_params
    params.require(:pomodoro).permit(:start, :end)
  end
end
