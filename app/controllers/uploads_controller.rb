class UploadsController < ApplicationController
  
  
  def create
    @flashcard = Flashcard.find(params[:flashcard_id])    
    @upload = @flashcard.uploads.new(upload_params)  
    # if the resource saves    
    if @upload.save             # save the model in the database. 
      redirect_to flashcard_path(@flashcard)    #send the user back to the original flashcard (uses a helper to direct to the flashcard with 'flashcard_path')
    #otherwise, return to the new flashcrad form
    #Render method is used (rather than redirect)so that the @flashcard object is passed back to the new template when it is rendered. 
    else
      render 'new'
    end
  end
  
  def destroy
    @flashcard = Flashcard.find(params[:flashcard_id])
    @upload = @flashcard.uploads.find(params[:id])
    @upload.destroy
    redirect_to flashcard_path(@flashcard)    
  end

#--------------PRIVATE---------------

  #private method for getting params of upload - a body of the note is required
  private
  def upload_params
    params.require(:upload).permit(:upload)
  end

  
end #end of controller
