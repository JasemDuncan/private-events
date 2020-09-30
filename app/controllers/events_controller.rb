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
    
    def edit
        @event=Event.find(params[:id])
    end
    #POST /events
    def create
        #INSERT INTO
        @event=Event.new(article_params)
        
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
        @event=Event.find(params[:id])
        if @event.update(article_params)
            redirect_to @event
        else
            render :edit
        end
    end

    private
    def article_params
        params.require(:event).permit(:name, :organizer, :description, :typeof, :category, :tags, :datestart, :dateend, :timestart, :timeend, :attendees, :location, :image, :link)
    end
end
