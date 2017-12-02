module ApplicationHelper
  def format_datetime(datetime)
		return datetime.strftime("%B %e, %Y %l:%M %p")
	end
end
