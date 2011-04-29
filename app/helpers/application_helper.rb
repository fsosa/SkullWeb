module ApplicationHelper

def nav
	if params[:controller] == "hj"
		return "active"
	else
		puts 'what'
	end
end

end
