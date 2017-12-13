module ApplicationHelper
  def format_url path
    path.start_with?('http://') ? path : "http://#{path}"
  end

  def format_date datetime
    datetime.localtime.strftime('on %b %d, %Y at %I:%M%P %Z')
  end
end
