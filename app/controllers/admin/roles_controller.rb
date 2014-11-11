class Admin::RolesController < ApplicationController
  before_action :set_role, only: [:modify]
  layout 'adminlayout'
  protect_from_forgery :only => :index
  # GET /admin/roles
  # GET /admin/roles.json
  def index
  end

  #GET /admin/roles/list
  def list
    start=params[:start].to_i
    limit=params[:limit].to_i
    roles=Role.order("id").limit(limit).offset(start)
    count=Role.count :all
   render :text =>get_json(count,roles.to_json)
  end
  
    # POST /roles
  # POST /roles.json
  def create
        @role = Role.new(role_params)
    info = @role.save ? 'success' : '添加失败' 
   render :text => get_result(info)
  end
  
  #POST /admin/roles/1/modify
  def modify
      info = @role.update(role_params) ? 'success' : '更新失败'
      render :text => get_result(info)
  end

# POST /admin/roles/delete
 def delete
    begin
      ids = params[:id][1..params[:id].length-2].split(',')
      Role.destroy(ids)
      info = 'success'
    rescue Exception => e
      logger.error e.to_s
      info = "删除异常"
    end
    render :text => get_result(info)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.permit(:name, :description)
    end
end
