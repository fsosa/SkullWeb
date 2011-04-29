class UsersController < ApplicationController

  def new
	@user = User.new
  
	unless @user.save
		render 'new'
	end  
  end

  def show
  end

  def edit
  end

  def update
  end
  
  def create
	@user = User.new(params[:user])
	if @user.save
		#success!
		redirect_to "/"
	else
		render 'new'
	end
	
  end

end
