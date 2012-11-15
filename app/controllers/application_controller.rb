require 'controller_support/user_support'
require 'controller_support/errors_support'

class ApplicationController < ActionController::Base

  before_filter :under_construction

  protect_from_forgery

  include UserSupport
  include ErrorsSupport

  def under_construction
    flash.now.alert = I18n.t("flashes.under_construction")
  end

end
