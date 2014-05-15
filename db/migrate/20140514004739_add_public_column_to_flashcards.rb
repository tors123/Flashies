class AddPublicColumnToFlashcards < ActiveRecord::Migration
  def change
    add_column :flashcards, :public, :boolean
  end
end
