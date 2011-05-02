
class HjController < ApplicationController

#/GET/hj
@newtime
def setscurrent(due_year, due_month, due_day)
	year=due_year
	month=due_month
	day=due_day
	while true do
		if Time.local(year, month, day).wday == 1
			@currentmonth="#{Time.local(year, month, day).strftime("%B")}"
			@currentmonthshort="#{Time.local(year, month, day).strftime("%b")}"
			@currentday="#{Time.local(year, month, day).strftime("%d")}"
			@currentyear="#{Time.local(year, month, day).strftime("%Y")}"
			break
		end
		if day <= 1
			if month == 1
				month =12
			else
				month.to_i - 1
			end
			if month%2
				if month ==2
					day = 28
				else
					day= 30
				end
			else
				day =31
			end
		else
			day=day.to_i - 1
		end
	end
	return @currentmonth, @currentday, @currentyear, @currentmonthshort
end
def index
  #this is a helper method (see /app/helpers/application.rb)
  #which makes sure that a user is logged in in order to see the page
  require_user
  
  #this just calls the method below
  list_jobs
  if @newtime == nil
	@newtime = Time.now
  end
  puts @newtime
  @week_thing = setscurrent(@newtime.year, @newtime.month, @newtime.day)[0]  + " " + setscurrent(@newtime.year, @newtime.month, @newtime.day)[1] 
end

def weekChange
puts @newtime
@newtime = params["time"]
  if @newtime == nil
	@newtime = Time.now
  end
	if params["sub"] == "prev"
	
		old_month =setscurrent(@newtime.year, @newtime.month, @newtime.day)[0]
		old_year =setscurrent(@newtime.year, @newtime.month, @newtime.day)[3]
		new_day = setscurrent(@newtime.year, @newtime.month, @newtime.day)[1].to_i - 1
		@week_thing = setscurrent(old_year, old_month, new_day)[0] + " " + setscurrent(old_year, old_month, new_day)[1]
		@newtime = Time.local(setscurrent(old_year, old_month, new_day)[2],setscurrent(old_year, old_month, new_day)[3], setscurrent(old_year, old_month, new_day)[1])
		puts @newtime
	elsif params["sub"] == "this"
		puts "worked"
	elsif params["sub"] == "next"
		puts "you suck"
	end
	puts @week_thing.to_s
	respond_to do |format|
		format.xml { render :text => @week_thing.to_s, :text =>@newtime}
	end
end

def list_jobs
  #initialize a new instance variable to store the data we want to display
  #instance variables (annoted with '@') are available to the corresponding controller
  @uhjs =[]
  
  #find every house job
  #ruby symbols (annoted with ':') are basically lightweight strings that 
  #allow the string to be reused a lot without memory waste
  
  userhjs = UserHj.find(:all, :order => "due")
  
  #calling .each on a iterable variable is the exact same as 
  #doing a for loop on every item in the iterable. 
  #ruby provides it for simplicity
  
  # 'do' is the same thing as a brace '{'
  # |x| indicates that x is each individual looped variable
  # i.e. it is the same as doing 'for(x in array)' in other languages
  
  #all loops and if/else statements MUST either use the typical brace delimters
  # i.e. if { #do stuff}
  # OR 
  # if do #doing stuff end
  #  { } or do/end
  #whichever is fine
  
  #here we loop through every UserHj row and call the model's username_desc
  #method on it (see in /app/models/user_hj)
  #which returns an array [fullname, hj_description]
  #and then we push it to the array
  userhjs.each do |uhj|
	@uhjs.push(uhj.username_desc)
  end
  
  #methods with a bang (!) at the end is a ruby convention that means that the method
  #permanently modifies the object it is being called on.
  @uhjs.uniq!
  
end




def completeJob
	id = current_user.id
	hj = HouseJob.find(:all, :conditions => {:description => params["desc"]})[0]
	uhj = UserHj.find(:all, :conditions => {:assigned_user_id =>  id, :hj_id => hj.id})
	if uhj != nil 
		uhj.each do |u|
		  if u.isComplete == nil or u.isComplete == false
			u.update_attributes(:isComplete => true)
		  else
			u.update_attributes(:isComplete => false)
		  end 
		end
	end
	
	respond_to do |format|
	  format.xml { render :text => "YOOO"}
	end
	
end


end
