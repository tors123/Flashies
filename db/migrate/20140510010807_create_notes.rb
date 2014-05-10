class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :body
      #this line adds an integer column called 'flashcard_id' as a foreign key
      t.references :flashcard, index: true

      t.timestamps
    end
  end
end
