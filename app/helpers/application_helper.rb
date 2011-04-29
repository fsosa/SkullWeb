module ApplicationHelper

def activate(nav)
  if params[:controller]  == nav
	return 'class=active'
  end
end

end
