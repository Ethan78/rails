module ApplicationHelper
	title="Morning Glory"
	title=@page_title+" - "+title if @page_title
	title

	def menu_link_to(text,path)
		link_to_unless_current(text,path){content_tag(:span,text)}
	end
end
