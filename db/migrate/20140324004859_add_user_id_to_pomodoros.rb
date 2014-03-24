class AddUserIdToPomodoros < ActiveRecord::Migration
  def change
    Pomodoro.delete_all
    add_column :pomodoros, :user_id, :integer, null: false
    add_foreign_key :pomodoros, :users
    add_index :pomodoros, :user_id
  end
end
