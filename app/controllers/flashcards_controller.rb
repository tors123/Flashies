class FlashcardsController < ApplicationController
  #users must be signed in to access their flashcards
  before_action :sign_in_user
 
  # define the action to create a new controller (constructor?)
  def new
    @flashcard = Flashcard.new
  end
  
  # define the action for creating a new flashcard
  def create
    #@user = User.find(params[:user_id])    #find the flashcard this note is associated with
    @flashcard = current_user.flashcards.build(flashcard_params)  #get the params entered and creat and save the note, automatically links to the particular flashcard
    
    # if the flash card met the title validations (set in model), save it to the db
    if @flashcard.save             # save the model in the database. 
      redirect_to @flashcard    
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
    
    redirect_to user_path(current_user)
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
 
  #--------------PRIVATE---------------
 
  # create a method for accessing the flashcards paramaters (controllers require strong paramenters for security)
  private
  def flashcard_params
    params.require(:flashcard).permit(:title, :question)  #permit allows to accept both title and question in this action
  end
end
