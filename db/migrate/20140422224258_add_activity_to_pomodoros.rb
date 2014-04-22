class AddActivityToPomodoros < ActiveRecord::Migration
  def change
    Pomodoro.delete_all
    add_column :pomodoros, :activity, :integer, null: false, default: 0
  end
end
