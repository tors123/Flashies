module FlashcardsHelper
  #checks flashcard author against current user
  def canEditDelete(flashcard_user)
      session[:id] == flashcard_user #need to access current user ID
  end 
end
