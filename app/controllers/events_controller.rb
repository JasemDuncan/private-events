class EventsController < ApplicationController

    #GET /events
    def index
        @events=Event.all
    end
    #GET /events/:id
    def show
        @event=Event.find(params[:id])
    end
    #GET /events/new
    def new
        @event=Event.new
    end
    #POST /events
    def create
        @event=Event.new(name: params[:event][:name], organizer: params[:event][:organizer], 
            description: params[:event][:description], typeof: params[:event][:typeof],
            category: params[:event][:category], tags: params[:event][:tags],
            datestart: params[:event][:datestart], dateend: params[:event][:dateend],
            timestart: params[:event][:timestart], timeend: params[:event][:timeend],
            attendees: params[:event][:attendeees], location: params[:event][:location],
            location: params[:event][:location], image: params[:event][:image],
            link: params[:event][:link])
        
        if @event.save
            redirect_to @event
        else    
            render :new
        end
    end
end
