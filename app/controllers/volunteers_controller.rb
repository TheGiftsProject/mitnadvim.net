class VolunteersController < ApplicationController

  # GET /volunteers/1
  # GET /volunteers/1.json
  def show

    @user = User.find(params[:id])
    @closed_requests = @user.requests.where(:status => 'closed')
    @open_requests   = @user.requests.where(:status => 'open')


    #TODO:SAKIN add validation for users that are volunteers

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
end
