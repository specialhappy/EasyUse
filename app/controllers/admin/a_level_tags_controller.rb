class Admin::ALevelTagsController < ApplicationController
  before_action :set_a_level_tag, only: [:modify]
  layout 'adminlayout'
  protect_from_forgery :only => :index
  # GET /admin/a_level_tags
  # GET /admin/a_level_tags.json
  def index
  end

  #GET /admin/a_level_tags/list
  def list
    start=params[:start].to_i
    limit=params[:limit].to_i
    a_level_tags=ALevelTag.order("id").limit(limit).offset(start)
    count=ALevelTag.count :all
   render :text =>get_json(count,a_level_tags.to_json)
  end
  
    # POST /a_level_tags
  # POST /a_level_tags.json
  def create
        @a_level_tag = ALevelTag.new(a_level_tag_params)
    info = @a_level_tag.save ? 'success' : '添加失败' 
   render :text => get_result(info)
  end
  
  #POST /admin/a_level_tags/1/modify
  def modify
      info = @a_level_tag.update(a_level_tag_params) ? 'success' : '更新失败'
      render :text => get_result(info)
  end

# POST /admin/a_level_tags/delete
 def delete
    begin
      ids = params[:id][1..params[:id].length-2].split(',')
      ALevelTag.destroy(ids)
      info = 'success'
    rescue Exception => e
      logger.error e.to_s
      info = "删除异常"
    end
    render :text => get_result(info)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_a_level_tag
      @a_level_tag = ALevelTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def a_level_tag_params
      params.permit(:name,:description)
    end
end
