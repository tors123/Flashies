class UsersController < ApplicationController
  #---before filters---
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :sign_in_user, only: [:edit, :update, :destroy]
  # correct_user before filter defines @user, can omit finding @user from edit & update actions
  before_action :correct_user, only: [:edit, :update, :destroy]

  #---actions---
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @flashcards = @user.flashcards.paginate(page: params[:page])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

      if @user.save
        sign_in @user
        flash[:success] = "Welcome to Flashies!"
        redirect_to @user
      else
        render :new 
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    #update the user based on the submitted params hash, 
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #--------------PRIVATE---------------
  private
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
      end
    
      #---before filters---
      
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
            
      #check that the user is the correct user (users can only eit their own account)
      def correct_user
        @user = User.find(params[:id])
        #correct_user filter uses the current_user? boolean method, defined in the Sessions helper 
        redirect_to(root_url) unless current_user?(@user)
      end
end

