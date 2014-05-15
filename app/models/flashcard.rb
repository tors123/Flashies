class Flashcard < ActiveRecord::Base
  #flash cards are associated with one user
  belongs_to :user
  #order the topics of flashcards
  default_scope { order('lower(title)')}
  
  #ensure that flashcards have a title of at least 2 characters
  validates :title, presence: true, length: { minimum: 2}
  #flashcards have to be attached to a user
  validates :user_id, presence: true
  
  #allow a flashcard to have many notes attached
  #also ensure that if a flashcard is deleted, its notes are deleted from the db
  has_many :notes, dependent: :destroy
  has_many :uploads, dependent: :destroy, autosave: true
 
   def self.search(keywords)
    #Flashcard.connection.clear_query_cache
 #   regexp = /#{keywords}/i;
    result = Flashcard.where('title LIKE ? or question LIKE ?', "%#{keywords}%", "%#{keywords}%", ).order('title DESC')
#    result.sort{|x, y| (x =~ regexp) <=> (y =~ regexp) } #sort the answer by closest match to the keyword - see: http://stackoverflow.com/questions/22435780/how-to-order-results-by-closest-match-to-query
  end
end
