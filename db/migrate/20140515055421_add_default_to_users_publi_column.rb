class AddDefaultToUsersPubliColumn < ActiveRecord::Migration
  def change
    change_column(:flashcards, :public, :boolean, :default => false)
  end
end
