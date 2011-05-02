module HjHelper

def setscurrent(due_year, due_month, due_day)
	@currentweek
	year=due_year
	month=due_month
	day=due_day
	while true do
		if Time.local(year, month, day).wday == 1
			@currentweek="#{Time.local(year, month, day).strftime("%B")}" + " "+ "#{Time.local(year, month, day).strftime("%d")}"
			break
		end
		if day == 1
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
	puts Time.local(year, month, day).strftime("%d")
	return @currentweek
end


end
