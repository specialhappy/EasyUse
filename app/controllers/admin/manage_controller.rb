class Admin::ManageController < ApplicationController
  layout 'adminlayout'
  def index
  end
  
  def login
  end
  
    def validate
          #先查询users里是否有与提交的validates的email的值。如果没有的话，则报错用户名不存在；如果有的话，则对它的password值进行比对。
    @user=User.where( email: login_params[:email] ).take
    if @user.email != '' and @user.password == login_params[:password] and session[:role_name]!='普通用户'
      session[:user_id]=@user.id
      session[:user_name]=@user.name
      session[:role_name]=@user.role.name
      redirect_to admin_manage_index_url
    else
    #我最好在这里显示一个提示
      redirect_to admin_manage_login_url
    end
  end
  
    def logout
    reset_session
    redirect_to welcome_index_url
  end
  
    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def login_params
      params.require(:login).permit(:email,:password)
    end
end
