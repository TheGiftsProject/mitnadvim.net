class ActivityMailerPreview

  def volunteer_responded
    ActivityMailer.volunteer_responded response
  end

  def activity_completed
    ActivityMailer.activity_completed completed_response
  end

  private

  def response
    Response.last
  end

  def completed_response
    Response.completed.last
  end

end
