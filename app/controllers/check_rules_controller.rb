class CheckRulesController < ApplicationController
  before_action :set_check_rule, only: [:show, :edit, :update, :destroy]

  # GET /check_rules
  # GET /check_rules.json
  def index
    @check_rules = CheckRule.all
  end

  # GET /check_rules/1
  # GET /check_rules/1.json
  def show
  end

  # GET /check_rules/new
  def new
    @check_rule = CheckRule.new
  end

  # GET /check_rules/1/edit
  def edit
  end

  # POST /check_rules
  # POST /check_rules.json
  def create
    @check_rule = CheckRule.new(check_rule_params)

    respond_to do |format|
      if @check_rule.save
        format.html { redirect_to @check_rule, notice: 'Check rule was successfully created.' }
        format.json { render :show, status: :created, location: @check_rule }
      else
        format.html { render :new }
        format.json { render json: @check_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /check_rules/1
  # PATCH/PUT /check_rules/1.json
  def update
    respond_to do |format|
      if @check_rule.update(check_rule_params)
        format.html { redirect_to @check_rule, notice: 'Check rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @check_rule }
      else
        format.html { render :edit }
        format.json { render json: @check_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /check_rules/1
  # DELETE /check_rules/1.json
  def destroy
    @check_rule.destroy
    respond_to do |format|
      format.html { redirect_to check_rules_url, notice: 'Check rule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check_rule
      @check_rule = CheckRule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_rule_params
      params.require(:check_rule).permit(:name, :description)
    end
end
