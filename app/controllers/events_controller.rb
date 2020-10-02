class EventsController < ApplicationController
    before_action :authenticate_u!, except: [:show, :index]
    before_action :set_event, except: [:index,:new, :create]
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
        @categories=Category.all
    end
    
    def edit
        #not necesario bacause of the before_action :set_event
        # @event=Event.find(params[:id])
    end
    #POST /events
    def create
        #INSERT INTO
        @event=current_u.events.new(event_params)
        @event.categories=params[:categories]        
        if @event.save
            redirect_to @event
        else    
            render :new
        end
    end
    # delete "/events/:id" 
    def destroy
        #DELETE FROM events
        # @event=Event.find(params[:id])
        @event.destroy #Destroy delete the object from the DB
        redirect_to events_path        
    end
    #PUT /events/:id
    def update
        #UPDATE
        #@event.update_attributes({name: 'New name event'})
        # @event=Event.find(params[:id])
        if @event.update(event_params)
            redirect_to @event
        else
            render :edit
        end
    end

    private

    def set_event 
        @event=Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:name, :organizer, :description, :typeof, :category, :tags, :datestart, :dateend, :timestart, :timeend, :attendees, :location, :image, :link, :cover, :categories)
    end
end
