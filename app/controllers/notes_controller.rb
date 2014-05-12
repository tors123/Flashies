class NotesController < ApplicationController
  
  #create a note -- associated objects use build rather than create
  def create
    @flashcard = Flashcard.find(params[:flashcard_id])    #find the flashcard this note is associated with
    @note = @flashcard.notes.build(note_params)  #get the params entered and creat and save the note, automatically links to the particular flashcard
    
    # if the note     
    if @note.save             # save the model in the database. 
      redirect_to flashcard_path(@flashcard)    #send the user back to the original flashcard (uses a helper to direct to the flashcard with 'flashcard_path')
    #otherwise, return to the new flashcrad form
    #Render method is used (rather than redirect)so that the @article object is passed back to the new template when it is rendered. 
    else
      render 'new'
    end
  end
  
  #delete a note - fired by view & arrives with id of note
  #The destroy action will find the flashcard we are looking at, locate the note within the @flashcard.notes collection, 
  # and then remove it from the database and send us back to the show action for the flashcard.
  def destroy
    @flashcard = Flashcard.find(params[:flashcard_id])
    @note = @flashcard.notes.find(params[:id])
    @note.destroy
    redirect_to flashcard_path(@flashcard)
  end
  

  
  #--------------PRIVATE---------------

  #private method for getting params of note - a body of the note is required
  private
  def note_params
    params.require(:note).permit(:body)
  end
  
  
 
  
  
end #end of controller
