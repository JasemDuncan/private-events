class UsersController < ApplicationController
    def index
      @us = User.all
    end
  
    def new
      @u = User.new
    end
  
    def create
      @u = User.new(u_params)
      @u.save
      session[:u_id] = @u.id
      redirect_to '/welcome'
    end
  
    def show
      @u = U.find(params[:id])
      @events = Event.all
    end
  
    def log_in
      @u = U.find_by_name(params[:name])
    end
  
    private
  
    def u_params
      params.require(:u).permit(:email)
    end
  end
  