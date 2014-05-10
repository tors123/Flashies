class Flashcard < ActiveRecord::Base
  #allow a flashcard to have many notes attached
  #also ensure that if a flashcard is deleted, its notes are deleted from the db
  has_many :notes, dependent: :destroy
  #ensure that flashcards have a title of at least 2 characters
  validates :title, presence: true,
    length: { minimum: 2}
end
