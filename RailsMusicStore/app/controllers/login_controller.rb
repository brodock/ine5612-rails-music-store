class LoginController < ApplicationController
  
  def index
    # Login Screen from Template
  end
  
  def login
    if session["user"] == User.authenticate(params["name"], params["passwd"])
      redirect_to :controller => 'main'
    else
      redirect_to :action => 'index' 
    end 
  end

end
