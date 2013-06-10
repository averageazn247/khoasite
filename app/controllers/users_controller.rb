class UsersController < ApplicationController
    before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
   
  def new
    @user = User.new
  end
  
  def create
     @user = User.new(params[:user])
    if @user.save
      #UserMailer.registration_confirmation(@user).deliver
     sign_in @user
      flash[:success] = "Thanks for registering!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show
     @user =User.find(params[:id])
    allevents=Event.all
    @events= allevents

   
    @events_by_date = @events.group_by(&:dayof)
     
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  
  end
    
   def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  def index
    @users= User.all
  end
  def edit
    @user= User.find(params[:id])
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
  
     def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
 
   
end
