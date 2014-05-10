class CreateFlashcards < ActiveRecord::Migration
  def change
    create_table :flashcards do |t|
      t.string :title
      t.text :question
 
      t.timestamps
   end
  end
end
