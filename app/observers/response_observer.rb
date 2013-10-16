class ResponseObserver < ActiveRecord::Observer

  observe :response

  def after_update(response)
    if response.was_status_changed? and response.new_status == :completed
      ActivityMailer.activity_completed(response).deliver
    end
  end

end