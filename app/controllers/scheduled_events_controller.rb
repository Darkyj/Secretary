class ScheduledEventsController < ApplicationController
  def new
  end

  def show
  	if !signed_in?
  		redirect_to root_path
  	end
  end

end
