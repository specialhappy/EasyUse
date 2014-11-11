class Admin::GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  layout 'adminlayout'
  protect_from_forgery :only => :index
  # GET /admin/groups
  # GET /admin/groups.json
  def index
  end

  #GET /admin/groups/list
  def list
    start=params[:start].to_i
    limit=params[:limit].to_i
    groups=Group.order("id").limit(limit).offset(start)
    count=Group.count :all
   render :text =>get_json(count,groups.to_json)
  end
  
    # POST /groups
  # POST /groups.json
  def create
        @group = Group.new(:name => params[:name].to_s,:status => params[:status].to_s,:description => params[:description].to_s,:create_time => params[:create_time].to_s)
    info = @group.save ? 'success' : '添加失败' 
   render :text => get_result(info)
  end
  
  #POST /admin/groups/1/modify
  def modify
    begin
 group = Group.find(params[:id])
      group.name = params[:name].to_s
      group.description = params[:description].to_s
      group.status = params[:status].to_s
        info = group.save ? 'success' : '更新失败'
      rescue ActiveRecord::RecordNotFound
        logger.error '更新不存在的数据'
        info = '不存在的数据'
      rescue Exception => e
        logger.error e.to_s
        info = "更新异常"
      end
      render :text => get_result(info)
  end

# POST /admin/groups/delete
 def delete
    begin
      ids = params[:id][1..params[:id].length-2].split(',')
      Group.destroy(ids)
      info = 'success'
    rescue Exception => e
      logger.error e.to_s
      info = "删除异常"
    end
    render :text => get_result(info)
  end
  
 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params[:group]
    end
end
