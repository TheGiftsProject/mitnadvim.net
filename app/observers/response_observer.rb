class ResponseObserver < ActiveRecord::Observer

  observe :response

  def after_create(response)
    ActivityMailer.volunteer_responded(response).deliver
  end

  def after_update(response)
    if response.status_changed? and response.status == :completed
      ActivityMailer.activity_completed(response).deliver
    end
  end

end