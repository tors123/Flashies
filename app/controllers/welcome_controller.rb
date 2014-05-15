class WelcomeController < ApplicationController
  def index
    @public = Flashcard.where("public = ?",'t').order('title DESC') #loads all public flashcards
  end
end
