class Admin::ManageController < ApplicationController
  layout 'adminlayout'
  def index
  end
  
  def login
  end
  
    def validate
          #先查询users里是否有与提交的validates的email的值。如果没有的话，则报错用户名不存在；如果有的话，则对它的password值进行比对。
    @user=User.where( email: login_params[:email] ).take
    if @user.email != '' and @user.password == login_params[:password] and @user.role_id!=1
      session[:user_id]=@user.id
      session[:user_name]=@user.name
      session[:role_name]=@user.role.name
      priviligeIds=@user.role.privilige_ids
      str1="0"
 if priviligeIds.include?1 or  priviligeIds.include?2
      str1="1"
      if priviligeIds.include?1
        str1+="1"
        else
          str1+="0"
      end
     if priviligeIds.include?2
        str1+="1"
        else
          str1+="0"
      end
    end
    str2="0"
 if priviligeIds.include?3 or  priviligeIds.include?4 or  priviligeIds.include?5 or  priviligeIds.include?6
      str2="1"
     if priviligeIds.include?3
        str2+="1"
        else
          str2+="0"
      end
       if priviligeIds.include?4
        str2+="1"
        else
          str2+="0"
      end
       if priviligeIds.include?5
        str2+="1"
        else
          str2+="0"
      end
       if priviligeIds.include?6
        str2+="1"
        else
          str2+="0"
      end
    end
    str3="0"
 if priviligeIds.include?7 or  priviligeIds.include?8 or  priviligeIds.include?9 or  priviligeIds.include?10
      str3="1"
       if priviligeIds.include?7
        str3+="1"
        else
          str3+="0"
      end
         if priviligeIds.include?8
        str3+="1"
        else
          str3+="0"
      end
         if priviligeIds.include?9
        str3+="1"
        else
          str3+="0"
      end
         if priviligeIds.include?10
        str3+="1"
        else
          str3+="0"
      end
    end
      str4="0"
 if priviligeIds.include?11 or  priviligeIds.include?12
      str4="1"
         if priviligeIds.include?11
        str4+="1"
        else
          str4+="0"
      end
           if priviligeIds.include?12
        str4+="1"
        else
          str4+="0"
      end
    end
     session[:privilige_appointment]=str1
      session[:privilige_instrument]=str2
      session[:privilige_user]=str3
      session[:privilige_privilige]=str4
      
#      render :text => str1+str2+str3+str4
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
