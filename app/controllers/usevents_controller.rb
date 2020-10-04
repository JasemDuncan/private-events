class UseventsController< ApplicationController
    def new
      # # @usevent = current_u.usevents.new
      @usevent=urrent_u.usevents.build
    end
  
    def create
      @usevent = current_u.usevents.build
      # puts @usevent
      # @usevent.event_id="1"
      @usevent.event_id = params[:event_id]
      puts "Duncan"
      puts params[:event_id]
      puts "jasem"
      @usevent.save
      redirect_to '/events'
    end
  end
