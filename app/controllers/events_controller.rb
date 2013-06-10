class EventsController < ApplicationController
   
  before_filter :set_current_user
  
  def new
    
    @event = Event.new
  end
  
  def create
        @user = current_user
    params[:event].parse_time_select! :start_time

    @event = Event.new(params[:event]) 
    
     @event = Event.new(params[:event])
    if @event.save
      #UserMailer.registration_confirmation(@user).deliver
      flash[:success] = "Thanks for schedualing an appointment and email will be sent if Khoa is unable to make the time!"
      redirect_to @event
    else
      render 'new'
    end
  end
  
  def show
    @event= Event.find(params[:id])
    allevents=Event.all
    @events= allevents.find(params[:creator==current_user.name])
 
    @events_by_date = @events.group_by(&:dayof) 
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
    
   
    def update
    params[:event].parse_time_select! :start_time
     
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:success] = "Appointment Updated!"
      redirect_to @event
    else
      render 'edit'
    end

  end
  def index
    @events= Event.all
  end
  def edit
    @event= Event.find(params[:id])
  end
  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Appointment removed."
    redirect_to users_url
  end
  
  
end
