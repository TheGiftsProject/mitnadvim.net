module SessionsHelper

  def sign_up_url(type)
    type == 'schools' ? new_school_path : new_user_path
  end

end