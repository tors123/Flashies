class Flashcard < ActiveRecord::Base
  #flash cards are associated with one user
  belongs_to :user
  #order the topics of flashcards
  default_scope { order('lower(title)')}
  
  #ensure that flashcards have a title of at least 2 characters
  validates :title, presence: true, length: { minimum: 2}, uniqueness: {case_sensitive: false}
  #flashcards have to be attached to a user
  validates :user_id, presence: true
  
  #allow a flashcard to have many notes attached
  #also ensure that if a flashcard is deleted, its notes are deleted from the db
  has_many :notes, dependent: :destroy
  has_many :uploads, dependent: :destroy, autosave: true
end
