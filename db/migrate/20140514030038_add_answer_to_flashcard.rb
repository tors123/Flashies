class AddAnswerToFlashcard < ActiveRecord::Migration
  def change
    add_column :flashcards, :answer, :string
  end
end
