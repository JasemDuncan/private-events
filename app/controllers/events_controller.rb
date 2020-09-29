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
end
