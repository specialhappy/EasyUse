class WelcomeController < ApplicationController
  layout 'customerlayout'
  protect_from_forgery :except => :search
  def index
    @instruments = Instrument.all
    @a_level_tags = ALevelTag.all
  end

  def login

  end
  
  def logout
    reset_session
    redirect_to welcome_index_url
  end

  def validates
    login=params[:login]

    #render  :text =>login[:email]

    #先查询users里是否有与提交的validates的email的值。如果没有的话，则报错用户名不存在；如果有的话，则对它的password值进行比对。
    @user=User.where( email: login[:email] ).take

    if @user.email != '' and @user.password == login[:password]
      session[:user_id]=@user.id
      session[:user_name]=@user.name
      redirect_to welcome_index_url
    else
    #我最好在这里显示一个提示
      redirect_to welcome_login_url
    end

  end

  #搜索的功能
  def search
    @instruments=Instrument.where("name LIKE '%#{params[:search]}%'")
  end
end
