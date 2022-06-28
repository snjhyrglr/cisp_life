module ApplicationHelper

  # def flash_class(level)
  #   case level
  #       when :notice then "alert alert-info"
  #       when :success then "alert alert-success"
  #       when :error then "alert alert-error"
  #       when :alert then "alert alert-error"
  #   end
  # end
  
  def nav_link(label, link, klass=nil)
    content_tag :li, class: 'nav-item' do
      link_to label, link, class: "nav-link #{klass}"
    end
  end

  def nav_item(label, link, klass=nil)
		content_tag :li, class: 'nav-item dropdown' do
			link_to label, link, class: "nav-link dropdown-toggle", id: "navbarDropdown", role: "button", 'data-bs-toggle': "dropdown"
		end
	end

end
