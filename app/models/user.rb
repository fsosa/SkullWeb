class User < ActiveRecord::Base
	acts_as_authentic
	
	def fullname
	  return "#{first_name} #{last_name}"
	end
end
