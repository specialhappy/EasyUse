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
      redirect_to welcome_index_url
    else
      redirect_to login_welcome_index_url
    end      
  end

  def search
    @instrument = Instrument.new
    @instruments = @instrument.search(params[:search])
  end
  
end
