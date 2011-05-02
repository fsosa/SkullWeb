module HjHelper

def setscurrent(due_year, due_month, due_day)

	year=due_year
	month=due_month
	day=due_day
	if day.to_s[1] == nil
				day="0"+day.to_s
				end
				if month.to_s[1] == nil
				month="0"+month.to_s
				end
	while true do
	#puts "#{day} #{month} #{year}"
	if day.to_i <= 1
			if month.to_i == 1
				month=12
			else
				month =month.to_i - 1
				if month.to_s[1] == nil
				month="0"+month.to_s
				end
			end
			if month.to_i%2==0
				if month.to_i==2
					day = 28
				else
					day= 30
				end
			else
				day =30
			end
		elsif day.to_i > 30
			if month.to_i == 12
				month=01
			else
				month =month.to_i + 1
				if month.to_s[1] == nil
				month="0"+month.to_s
				end
			end
			day=7
			if day.to_s[1] == nil
				day="0"+day.to_s
				end
			end
		if Time.parse("#{day} #{month} #{year}").wday.to_i== 1
		#puts month
			@currentmonth="#{Time.parse("#{day} #{month} #{year}").strftime("%B")}"
			@currentmonthshort="#{Time.parse("#{day} #{month} #{year}").strftime("%m")}"
			@currentday="#{Time.parse("#{day} #{month} #{year}").strftime("%d")}"
			@currentyear="#{Time.parse("#{day} #{month} #{year}").strftime("%Y")}"
			break
		
		else
			day=day.to_i- 1
			if day.to_s[1] == nil
				day="0"+day.to_s
				end
		end
	end
	return @currentmonth, @currentday, @currentyear, @currentmonthshort
end


end
