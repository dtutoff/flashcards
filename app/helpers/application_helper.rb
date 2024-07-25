module ApplicationHelper
  def format_date_time(date_time)
    date_time.strftime("%d %B %Y, %H:%M")
  end
end
