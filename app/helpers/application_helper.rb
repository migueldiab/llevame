module ApplicationHelper
  include SessionHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Bienvenido a llevame.com"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

end
