class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def reddit
    @reddit ||= Snoo::Client.new
  end
end
