class ResponseObserver < ActiveRecord::Observer

  observe :response

  def after_update(response)
    if response.status_changed? and response.status == :completed
      ActivityMailer.activity_completed(response).deliver
    end
  end

end