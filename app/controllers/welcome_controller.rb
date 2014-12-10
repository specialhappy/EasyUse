class WelcomeController < ApplicationController
  layout 'customerlayout'
  protect_from_forgery :except => :search
  def index
    @instruments = Instrument.all
    @a_level_tags = ALevelTag.all
  end

  def login
  end

  def register_form
  end

  def register
    @user = User.new
    if @user.register(params[:register])
      session[:user_id]=@user.id
      session[:user_name]=@user.name
      session[:role_id]=@user.role_id
      redirect_to welcome_index_url
    end
  end

  def logout
    reset_session
    redirect_to welcome_index_url
  end

  def validates
    @user = User.new
    if @user.validates(params[:login])
      session[:user_id]=@user.id
      session[:user_name]=@user.name
      session[:role_id]=@user.role_id
      if @user.role_id==1
         redirect_to welcome_index_url
      end
      if @user.role_id==2
        redirect_to maintainer_appointments_url 
      end
      if @user.role_id==3
        redirect_to manager_a_level_tags_url
      end
    else
      redirect_to login_welcome_index_url
    end      
  end

  def search
    @instrument = Instrument.new
    @instruments = @instrument.search(params[:search])
  end
  
end
