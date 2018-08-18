module ApplicationHelper
  def config_fetch key
    Config.fetch key
  end

  def navbar_pages
    Page.navbar
  end
end
