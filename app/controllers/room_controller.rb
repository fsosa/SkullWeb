class RoomController < ApplicationController

def index
  require_user
  room_list
end

def room_list
  @urrnames =[]
  alluserrr = Reservation.find(:all)
  
  alluserrr.each do |r|
    @urrs.push(r)
  end
  
  @userrr = Reservation.new
  @user = current_user
  
  @locations =["Chapter Room", "Music Room", "IRDF Room", "Center Room", "Room 57"]
  
  
  respond_to do |format|
	  format.html
	  format.xml
    end
end

def create
  date1 =[params[:m1],params[:d1],params[:y1]]
  date2 =[params[:m2],params[:d2],params[:y2]]
  time1 =[params[:timestart1],params[:timestart2],params[:timestart2]]
  time2 =[params[:timeend1],params[:timeend2],params[:timeend2]]
  @userrr = Reservation.new(:reserved_user_id =>current_user.id, :name=>params[:name][:size10],
	:location=>params[:locations], :start_date=>date1, :end_date=>date2, 
	:start_time=>time1, :end_time=>time2, :desc=>params[:descr][:size20])
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
