module ApplicationHelper

def activate(nav)
  if params[:controller]  == nav
	return 'active'
  end
end

end
