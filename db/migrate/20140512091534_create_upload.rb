class CreateUpload < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.attachment :upload
      
      #this line adds an integer column called 'flashcard_id' as a foreign key
      t.references :flashcard, index: true

    end
  end
end
