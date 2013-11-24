class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    # simple gon ussage ( attach to window)
    #gon.foo = "bar"
    # 
    # More complex usage... however users are Dynamic-data dont bootstrap
    # @users = User.all
    ##gon.users = @users
    #gon.rabl "app/views/users/index.json.rabl", as: "users"
    @user = User.first ## just an example of an authenticated user
    gon.rabl "app/views/users/show.json.rabl", as: "current_user"
  end


end
