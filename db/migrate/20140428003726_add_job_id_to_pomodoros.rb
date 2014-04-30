class AddJobIdToPomodoros < ActiveRecord::Migration
  def change
    add_column :pomodoros, :job_id, :string, length: 32
  end
end
