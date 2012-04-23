class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init_session
  before_filter :breadcrumbs
  
  def default_url_options
    if Rails.env.production?
      {:host => "listsharing.herokuapp.com"}
    else  
      {:host => "localhost:3000"}
    end
  end
  
  private
  
    def init_session
      session[:items_voted] ||= []
      session[:lists_voted] ||= []
    end
    
    def breadcrumbs
      @breadcrumbs = []
      @breadcrumbs << {'name' => "Lists", 'url' => "/", 'last_child' => true }
    end
end
