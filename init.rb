require "redmine"
require_dependency "inquiry/hooks"

Redmine::Plugin.register :inquiry do
  name 'Inquiry plugin'
  author 'Yoshiteru Takeshita'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  
  menu :project_menu, :geo_info, { :controller => "geo_info", :action => "index"},:caption => "geo_info", :param => :project_id
  menu :project_menu, :customer, { :controller => "customer", :action => "index"},:caption => "customer", :param => :project_id
  project_module :inquiry do
    permission :geo_viewer, :geo_info => [:index]
    permission :customer_viewer, :customer => [:index]
    permission :geo_editor, :geo_info => [:new, :edit]
    permission :customer_editor, :customer => [:new, :edit]
  end
  
  
  
end
