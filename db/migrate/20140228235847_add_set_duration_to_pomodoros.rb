class AddSetDurationToPomodoros < ActiveRecord::Migration
  def up
    add_column :pomodoros, :set_duration, :integer

    Pomodoro.update_all set_duration: 1500

    change_column :pomodoros, :set_duration, :integer, null: false
  end

  def down
    remove_column :pomodoros, :set_duration
  end
end
