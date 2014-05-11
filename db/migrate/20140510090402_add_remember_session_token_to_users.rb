class AddRememberSessionTokenToUsers < ActiveRecord::Migration
  def change
    #because we expect to retrieve users by remember token, we’ve added an index
    add_column :users, :remember_token, :string
    add_index :users, :remember_token
  end
end
