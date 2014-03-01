class AddNotNullToPomodoroStart < ActiveRecord::Migration
  def up
    change_column :pomodoros, :start, :datetime, null: false
  end

  def down
    change_column :pomodoros, :start, :datetime
  end
end
