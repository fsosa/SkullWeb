class RoomController < ApplicationController

def index
  require_user
  room_list
end

def room_list
  @userrr = Reservation.new
  @user = current_user
  
  @locations =["Chapter Room", "Music Room", "IRDF Room", "Center Room", "Room 57"]
  
  
  respond_to do |format|
	  format.html
	  format.xml
    end
end

def create
  @userrr = Reservation.new(:reserved_user_id =>current_user.id, :name=>params[:name][:size10],
	:location=>params[:locations], :start=>params[:start], :end=>params[:end])
    respond_to do |format|
      if @userrr.save
        format.html { redirect_to(:action => :index) }
        format.xml  { render :xml => @userrr, :status => :created, :location => @userrr }
      else
        format.html { redirect_to(:action => :index, :notice => 'Already made') }
        format.xml  { render :xml => @userr.errors, :status => :unprocessable_entity }
      end
    end
end

end
