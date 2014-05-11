#this class ensures emails are unique at the database level
class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
        add_index :users, :email, unique: true
  end
end
