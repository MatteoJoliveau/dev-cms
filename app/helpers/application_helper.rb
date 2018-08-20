module ApplicationHelper
  def config_fetch key
    Config.fetch key
  end

  def navbar_pages
    Page.navbar
  end

  def page_path page
    "#{root_path}#{page.path}"
  end

  def page_url page
    "#{root_url}#{page.path}"
  end
end
