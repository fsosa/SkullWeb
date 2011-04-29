class AdminsController < ApplicationController
  # GET /admins
  # GET /admins.xml
  def index
	if(!require_admin)
		return
	end
	
	#Get collection of all current users
	@users = User.find(:all)
	
	#Get collection of all house jobs
	@hjs = HouseJob.find(:all)
	
	#Create the new UserHj to fill in with data from the form
	@userhj = UserHj.new
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  
    end
  end
  
  def create 
	#Using the form data, we create a new UserHj...
	@userhj = UserHj.new(:assigned_user_id => params[:user][:id], :hj_id => params[:house_job][:id])

	#...and then try to save it to the database
    respond_to do |format|
      if @userhj.save
        format.html { redirect_to(:action => :index, :notice => 'Succesfully assigned job') }
        format.xml  { render :xml => @userhj, :status => :created, :location => @userhj }
      else
        format.html { redirect_to(:root, :notice => 'Duplicate job assignment') }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end
