class CreateFlashcards < ActiveRecord::Migration
  def change
    create_table :flashcards do |t|
      t.string :title
      t.text :question
      #this line adds an integer column called 'user_id' as a foreign key
      t.references :user, index: true

      t.timestamps
   end
  end
end
