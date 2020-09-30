class EventsController < ApplicationController

    #GET /events
    def index
        #Select * from Events
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
        #INSERT INTO
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
    # delete "/events/:id" 
    def destroy
        #DELETE FROM events
        @event=Event.find(params[:id])
        @event.destroy #Destroy delete the object from the DB
        redirect_to events_path        
    end
    #PUT /events/:id
    def update
        #UPDATE
        #@event.update_attributes({name: 'New name event'})
    end
end
