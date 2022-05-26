module ApplicationHelper
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
