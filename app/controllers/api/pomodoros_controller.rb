class API::PomodorosController < API::BaseController

  before_action :set_pomodoro, only: [:show, :destroy]

  def index
    @pomodoros = current_user.pomodoros
  end

  def show
  end

  def create
    @pomodoro = PomodoroFactory.new(current_user, pomodoro_params)

    if @pomodoro.save
      render json: @pomodoro.model, status: :created
    else
      render json: @pomodoro.model.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @pomodoro.destroy
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  private

  def set_pomodoro
    @pomodoro = current_user.pomodoros.find(params[:id])
  end

  def pomodoro_params
    params.require(:pomodoro).permit(:set_duration, :activity)
  end

end
