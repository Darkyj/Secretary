class ScheduledEventsController < ApplicationController
  def new

  	@event = current_user.scheduled_reminders.new

  end

  def create

  	@event = current_user.scheduled_reminders.new(events_params)
  	if @event.save
  		redirect_to scheduled_event_path(current_user)
  	else
  		render :new
  	end
  end

  def show

  	if !signed_in?
  		redirect_to new_session_path
  	end
  end

  private
  def events_params
  	params.require(:scheduled_reminder).permit(:title,:description,:start_time, :end_time)
  end

end
