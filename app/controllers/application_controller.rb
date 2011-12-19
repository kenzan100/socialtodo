class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :before_filter

  def before_filter
  end

end
