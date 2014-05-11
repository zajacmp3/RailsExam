module ApplicationHelper

def title(content)
  content_for(:title, content)
end

def page_title
  delimiter = "| "
  if content_for?(:title)
    "#{delimiter}#{content_for(:title)}"
  end
end

end
