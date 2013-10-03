class ActivityMailerPreview

  def volunteer_responded
    ActivityMailer.volunteer_responded response
  end

  private

  def response
    Response.last
  end

end
