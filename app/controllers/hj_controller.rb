class HjController < ApplicationController

#/GET/hj
def index
  #this is a helper method (see /app/helpers/application.rb)
  #which makes sure that a user is logged in in order to see the page
  require_user
  
  #this just calls the method below
  list_jobs
end

def list_jobs
  #initialize a new instance variable to store the data we want to display
  #instance variables (annoted with '@') are available to the corresponding controller
  @uhjs =[]
  
  #find every house job
  #ruby symbols (annoted with ':') are basically lightweight strings that 
  #allow the string to be reused a lot without memory waste
  
  userhjs = UserHj.find(:all)
  
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
