class NotesController < ApplicationController
  
  #create a note
  def create
    @flashcard = Flashcard.find(params[:flashcard_id])    #find the flashcard this note is associated with
    @note = @flashcard.notes.create(note_params)  #get the params entered and creat and save the note, automatically links to the particular flashcard
    redirect_to flashcard_path(@flashcard)    #send the user back to the original flashcard (uses a helper to direct to the flashcard with 'flashcard_path')
  end
  
  #delete a note - fired by view & arrives with id of note
  #The destroy action will find the flashcard we are looking at, locate the note within the @flashcard.notes collection, 
  # and then remove it from the database and send us back to the show action for the flashcard.
  def destroy
    @flashcard = Flashcard.find(params[:flashcard_id])
    @note = @flashcard.contes.find(params[:id])
    redirect_to flashcard_path(@article)
  end
  
  #private method for getting params of note - a body of the note is required
  private
  def note_params
    params.require(:note).permit(:body)
  end
  
 
  
  
end #end of controller
