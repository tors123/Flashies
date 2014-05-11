class AddUserIndexToFlashcards < ActiveRecord::Migration
  #attach the flashcards to users
  def change
    add_index :flashcards, [:user_id, :created_at]
  end
end
