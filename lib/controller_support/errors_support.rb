require 'active_support/concern'

module ErrorsSupport

  extend ActiveSupport::Concern

  included do
    #rescue_from Exception, :with => :render_error
  end

  def forbidden_page
    render :template => 'static_pages/forbidden', :status => :forbidden
  end

  def internal_error_page
    render :template => "static_pages/internal", :status => :internal_server_error
  end

  def not_found_page
    render :template => "static_pages/not_found", :status => :not_found
  end

  def render_error(exception)
    internal_error_page
  end

end