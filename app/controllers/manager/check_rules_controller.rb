class Manager::CheckRulesController < ApplicationController
  before_action :set_manager_check_rule, only: [:show, :edit, :update, :destroy]
layout 'customerlayout'
  # GET /manager/check_rules
  # GET /manager/check_rules.json
  def index
    @manager_check_rules = CheckRule.all
  end

  # GET /manager/check_rules/1
  # GET /manager/check_rules/1.json
  def show
  end

  # GET /manager/check_rules/new
  def new
    @manager_check_rule = CheckRule.new
  end

  # GET /manager/check_rules/1/edit
  def edit
  end

  # POST /manager/check_rules
  # POST /manager/check_rules.json
  def create
    @manager_check_rule = CheckRule.new(manager_check_rule_params)

    respond_to do |format|
      if @manager_check_rule.save
        format.html { redirect_to [:manager, @manager_check_rule], notice: 'Check rule was successfully created.' }
        format.json { render :show, status: :created, location: @manager_check_rule }
      else
        format.html { render :new }
        format.json { render json: @manager_check_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manager/check_rules/1
  # PATCH/PUT /manager/check_rules/1.json
  def update
    respond_to do |format|
      if @manager_check_rule.update(manager_check_rule_params)
        format.html { redirect_to [:manager, @manager_check_rule], notice: 'Check rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager_check_rule }
      else
        format.html { render :edit }
        format.json { render json: @manager_check_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manager/check_rules/1
  # DELETE /manager/check_rules/1.json
  def destroy
    @manager_check_rule.destroy
    respond_to do |format|
      format.html { redirect_to manager_check_rules_url, notice: 'Check rule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager_check_rule
      @manager_check_rule = CheckRule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_check_rule_params
      params.require(:check_rule).permit(:name, :description, :applid)
    end
end
