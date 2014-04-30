class API::PomodorosController < API::BaseController

  def index
    @pomodoros = current_user.pomodoros
  end

  def show
    @pomodoro = current_user.pomodoros.find(params[:id])
  end

  def create
    @pomodoro = PomodoroFactory.new(current_user, pomodoro_params)
    if @pomodoro.save
      render json: @pomodoro.model, status: :created
    else
      render json: @pomodoro.model.errors, status: :unprocessable_entity
    end
  end

  private

  def pomodoro_params
    params.require(:pomodoro).permit(:set_duration, :activity)
  end

end
