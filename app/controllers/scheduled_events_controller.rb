class ScheduledEventsController < ApplicationController
  def new

  	@event = current_user.scheduled_reminders.new

  end

  def create
  	@event = current_user.scheduled_reminders.new(events_params)
  	if @event.save
      ScheduledReminder.delay(queue: "scheduled_reminders", priority: 20, run_at: @event.start_time).deliver(@event.id)
  		redirect_to scheduled_event_path(current_user)
  	else
  		render :new
  	end
  end

  def show

  	if !signed_in?
  		redirect_to new_session_path
  	end
    @events = current_user.scheduled_reminders.all
  end

  private
  def events_params
  	params.require(:scheduled_reminder).permit(:title,:description,:start_time, :end_time)
  end

end
