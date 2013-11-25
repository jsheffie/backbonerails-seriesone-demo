class UsersController < ApplicationController
  respond_to :json

  def index
    # lets introduce some latency
    sleep 3
    @users = User.all
  end
end
