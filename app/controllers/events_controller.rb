class EventsController < ApplicationController
    before_action :authenticate_u!, except: [:show, :index]
    before_action :set_event, except: [:index,:new, :create]
    before_action :authenticate_editor!, only: [:new, :create, :update]
    before_action :authenticate_admin!, only: [:destroy, :publish]
    #GET /events
    def index
        #Select * from Events
        # @events=Event.all
        @events=Event.paginate(page: params[:page], per_page: 9).publicated.lastt        
    end
    #GET /events/:id
    def show
        @event=Event.find(params[:id])
    end
    #GET /events/new
    def new
        @event=Event.new
        @categories=Category.all
        @hascategories=HasCategory.all
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
        @event=Event.find(params[:id])
        # @hascategory=HasCategory.find_by(event_id: @event)
        @event.destroy #Destroy delete the object from the DB
        # @hascategory.destroy
        
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
    #PUT /events/:id
    def publish
        @event.publish!
        redirect_to @event      
    end

    private

    def set_event 
        @event=Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:name, :organizer, :description, :typeof, :tags, :datestart, :dateend, :timestart, :timeend, :attendees, :location, :link, :cover, :categories)
    end
end
