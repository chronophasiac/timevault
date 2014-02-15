class CreatePomodoros < ActiveRecord::Migration
  def change
    create_table :pomodoros do |t|
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
