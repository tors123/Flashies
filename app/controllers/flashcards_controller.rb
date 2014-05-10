class FlashcardsController < ApplicationController
  # define the action to create a new controller (constructor?)
  def new
    @flashcard = Flashcard.new
  end
  
  # define the action for creating a new flashcard
  def create
    # render plain: params[:flashcard].inspect -- for inspecting the values of the form. replace with saving to db
    # use the new flashcards model to save the data in the database....
    # initialize the model with its respective attributes, which are automatically mapped to 
    # the respective database columns. params[:article] contains the attributes we're interested in.    
    @flashcard = Flashcard.new(flashcard_params)
    
    # if the flash card met the title validations (set in model), save it to the db
    if @flashcard.save             # save the model in the database. 
      redirect_to @flashcard      # Redirect the user to the show action, which we'll define later.
    #otherwise, return to the new flashcrad form
    #Render method is used (rather than redirect)so that the @article object is passed back to the new template when it is rendered. 
    else
      render 'new'
    end
  end
  
  # update a flashcard 
  def update
    @flashcard = Flashcard.find(params[:id])
    
    if @flashcard.update(flashcard_params)
      redirect_to @flashcard
    else
      render 'edit'
    end
  end
  
  # edit a flashcard
  def edit
    @flashcard = Flashcard.find(params[:id])
  end
  
  # delete a flashcard
  def destroy
    @flashcard = Flashcard.find(params[:id])
    @flashcard.destroy
    
    redirect_to flashcards_path
  end
  
  # define the show method for a flash card
  def show
    # Use Article.find to find the article we're interested in, passing in params[:id] to get the :id parameter 
    # from the request. We also use an instance variable (prefixed by @) to hold a reference to the article object. 
    # (because Rails will pass all instance variables to the view)
    @flashcard = Flashcard.find(params[:id])
  end
  
  #index action for listing all flashcards
  def index
    @flashcards = Flashcard.all
  end
  
  # create a method for accessing the flashcards paramaters (controllers require strong paramenters for security)
  private
  def flashcard_params
    params.require(:flashcard).permit(:title, :question)  #permit allows to accept both title and question in this action
  end
end
