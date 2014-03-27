class API::PomodorosController < API::BaseController
  def index
    @pomodoros = current_user.pomodoros
  end

  def show
    @pomodoro = current_user.pomodoros.find(params[:id])
  end

  def create
    @pomodoro = current_user.pomodoros.build(pomodoro_params)
    @pomodoro.start = DateTime.now
    if @pomodoro.save
      @pomodoro.schedule_end
      render json: @pomodoro, status: :created
    else
      render json: @pomodoro.errors, status: :unprocessable_entity
    end
  end

  private

  def pomodoro_params
    params.require(:pomodoro).permit(:set_duration)
  end
end
