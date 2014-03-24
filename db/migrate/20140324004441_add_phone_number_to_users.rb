class AddPhoneNumberToUsers < ActiveRecord::Migration
  def change
    User.delete_all
    add_column :users, :phone_number, :string, null: false
  end
end
