class TerminalController < ApplicationController
  layout 'customerlayout'
  def login
    
  end
  
  def index
    @appointments = User.find(session[:user_id]).appointments
  end
  
  def validates
    login=params[:login]
    @user=User.where( email: login[:email] ).take
    
    if @user.email != ''
      session[:user_id]=@user.id
      session[:user_name]=@user.name
      redirect_to terminal_index_url
    else
      redirect_to terminal_login_url
    end
  end
end