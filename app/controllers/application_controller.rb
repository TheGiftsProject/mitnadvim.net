require 'controller_support/user_support'
require 'controller_support/errors_support'

class ApplicationController < ActionController::Base

  before_filter :under_construction

  protect_from_forgery

  include UserSupport
  include SchoolSupport
  include ErrorsSupport

  def under_construction
    # render the under construction label unless current action is run by the rails email preview engine
    flash.now.alert = I18n.t("flashes.under_construction") unless self.respond_to?(:test_deliver)
  end

end
