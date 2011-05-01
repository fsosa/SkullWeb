class RoomController < ApplicationController

def index
  require_user
  room_list
  list_rsvps
end

def list_rsvps
	@rsvp = Reservation.find(:all, :order => "start_time")
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
 if params[:timestart1]=="am"
   extra1 = 0
   else
   extra1 = 12
 end
  if params[:timestart2]=="am"
   extra2 = 0
   else
   extra2 = 12
 end
 extra1.to_i
 extra2.to_i
  hour1 = params[:timestart1].to_i+extra1-4
  hour2 = params[:timeend1].to_i+extra2-4
  
  if params[:timestart2] == ""
	 minute1 = 00
	end
  if params[:timeend2] == ""
  minute2 = 00
  end
  date1 =Time.parse("#{params[:d1]}"+"-"+"#{params[:m1]}"+"-"+"#{params[:y1]}")
  date2 =Time.parse("#{params[:d2]}"+"-"+"#{params[:m2]}"+"-"+"#{params[:y2]}")
  time1 =Time.parse("#{hour1}"+":"+"#{minute1}"+"#{params[:timestart3]}",date1)
  time2 =Time.parse("#{hour2}"+":"+"#{minute2}"+"#{params[:timeend3]}",date2)
 
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
