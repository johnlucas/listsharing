class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init_session
  before_filter :breadcrumbs
  
  private
  
    def init_session
      session[:items_voted] ||= []
      session[:lists_voted] ||= []
      puts session.to_yaml
    end
    
    def breadcrumbs
      @breadcrumbs = []
      @breadcrumbs << {'name' => "Lists", 'url' => "/", 'last_child' => true }
    end
end
