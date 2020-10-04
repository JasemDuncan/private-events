class UseventsController< ApplicationController
    def new
      # # @usevent = current_u.usevents.new
      @usevent=urrent_u.usevents.build
    end
  
    def create
      @usevent = current_u.usevents.build
      @usevent.event_id = params[:event_id]
      @usevent.save
      redirect_to '/events'
    end
  end
