class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :make_header, :make_link

  def make_header(title)
    "<h1>#{title}</h1>".html_safe
  end

  def make_link(text, path)
    if !path.is_a?(String)
      "<a href='#{path.class.to_s.downcase.pluralize}/#{path.id}'>#{text}</a>".html_safe
    else
      "<a href='#{path}'>#{text}</a>".html_safe
    end
  end

end
