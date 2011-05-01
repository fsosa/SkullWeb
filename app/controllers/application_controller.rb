class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  helper_method :current_user, :isComplete?
  
  private
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def require_user
	unless current_user
	  store_location
	  #consider adding notice mentioning that the user must be logged in
	  redirect_to (:login)
	  return false
	end
  end
  
  def require_admin
	unless current_user && current_user.admin
	  store_location
	  redirect_to :root, :notice => "Access denied: Administrator-only page"
	  return false
	end
	return true
  end
	
  def store_location
    session[:return_to] = request.request_uri
  end
  
  def isComplete?(hj)
	id = current_user.id
	hj = HouseJob.find(:all, :conditions => {:description => hj})[0]
	uhj = UserHj.find(:all, :conditions => {:assigned_user_id =>  id, :hj_id => hj.id})
	if uhj != nil
		uhj.each do |u|
			if u.isComplete == true
				return 'done'
			else
				return 'undone'
			end
		end
	end
  end
  
  
end
