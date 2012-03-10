class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init_session
  
  private
  
    def init_session
      session[:voted] ||= []
    end
end
