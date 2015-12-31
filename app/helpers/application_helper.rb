module ApplicationHelper

  def tag_list_from(resource)
    tags = "<div class='tags'><ul class='w-list-unstyled tag-list'>"
    resource.tag_list(current_locale).each do |tag|
      tags << "<li class='tag-name'><strong>#{tag}</strong></li>"
    end
    tags << "</ul></div>"
    tags.html_safe
  end
end
