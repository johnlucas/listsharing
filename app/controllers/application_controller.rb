class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init_session
  
  private
  
    def init_session
      session[:items_voted] ||= []
      session[:lists_voted] ||= []
      puts session.to_yaml
    end
end
