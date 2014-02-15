class API::PomodorosController < ApplicationController
  def index
    @pomodoros = Pomodoro.all
  end

  def show
    @pomodoro = Pomodoro.find(params[:id])
  end
end
