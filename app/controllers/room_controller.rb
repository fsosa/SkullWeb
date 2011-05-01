class RoomController < ApplicationController

def index
  require_user
  room_list
  list_rsvps
end

def list_rsvps
	@rsvp = Reservation.find(:all)
end


def room_list
  @urrnames =[]
  @urrs = []
  alluserrr = Reservation.find(:all)
  
  alluserrr.each do |r|
    @urrs.push(r)
  end
  
  @userrr = Reservation.new
  @user = current_user
  
  @locations =["Chapter Room", "Music Room", "IRDF Room", "Center Room", "Room 57"]
  
  
end

def create
  @userrr = Reservation.new(:reserved_user_id =>current_user.id, :name=>params[:name][:size10],
	:location=>params[:locations], :start_time=>params[:start], :end_time=>params[:end], 
	:start_date=>params[:start][:size20], :end_date=>params[:end][:size20], :desc=>params[:descr][:size20])
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
