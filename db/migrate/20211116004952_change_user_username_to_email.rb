class ChangeUserUsernameToEmail < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :username, :email
    
  end
end
