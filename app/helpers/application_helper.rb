module ApplicationHelper
  def config_fetch key
    Config.fetch key
  end
end
