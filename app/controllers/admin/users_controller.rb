class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  layout 'adminlayout'
  protect_from_forgery :only => :index
  # GET /admin/users
  # GET /admin/users.json
  def index
  end

  #GET /admin/users/list
  def list
    start=params[:start].to_i
    limit=params[:limit].to_i
    users=User.order("id").limit(limit).offset(start)
    count=User.count :all
   render :text =>get_json(count,users.to_json)
  end
  
    # POST /users
  # POST /users.json
 def create
			uploaded_io = params[:photoImg]
			if uploaded_io.nil? == false
			  name=getFileName(uploaded_io)
			File.open(Rails.root.join('app','assets', 'images', name), 'wb') do |file|
			file.write(uploaded_io.read)
			end
			end
			@user = User.new(:name => params[:name].to_s,:card_number => params[:card_number].to_s,:password => params[:password].to_s,:sex => params[:sex].to_s,:id_number => params[:id_number].to_s,:phone => params[:phone].to_s,:picture => name,:email => params[:email],:address => params[:address],:status => params[:status],:institution_id => params[:institution_id])
			info = @user.save ? 'success' : '添加失败'
			render :text => get_result(info)
			end
  
  #POST /admin/users/1/modify
  def modify
    uploaded_io = params[:photoImg]
      if uploaded_io.nil? == false
        name=getFileName(uploaded_io)
          File.open(Rails.root.join('app','assets', 'images', name), 'wb') do |file|
          file.write(uploaded_io.read)  
          end
      end
 user = User.find(params[:id])
      user.name = params[:name].to_s
      user.card_number = params[:card_number].to_s
      user.password = params[:password].to_s
      user.sex = params[:sex].to_s
      user.id_number = params[:id_number].to_s
      user.phone = params[:phone].to_s
      user.picture = name
      user.email = params[:email].to_s
      user.address = params[:address].to_s
      user.status = params[:status].to_s
      user.institution_id = params[:institution_id].to_s
        info = user.save ? 'success' : '更新失败'
      render :text => get_result(info)
  end

# POST /admin/users/delete
 def delete
    begin
      ids = params[:id][1..params[:id].length-2].split(',')
      User.destroy(ids)
      info = 'success'
    rescue Exception => e
      logger.error e.to_s
      info = "删除异常"
    end
    render :text => get_result(info)
  end

  private
  def getFileName(uploaded_io)
    if uploaded_io.nil? == false
        @strs=uploaded_io.content_type.to_s.split("/")
   @time=Time.new.to_s
   @fileName=@time+'.'+@strs[1]
    return @fileName
    end
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user]
    end
end
