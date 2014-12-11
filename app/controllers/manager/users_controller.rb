class Manager::UsersController < ApplicationController
  before_action :set_manager_user, only: [:show, :edit, :update, :destroy]
layout 'customerlayout'
  # GET /manager/users
  # GET /manager/users.json
  def index
    @manager_users = User.all
  end

  # GET /manager/users/1
  # GET /manager/users/1.json
  def show
  end

  # GET /manager/users/new
  def new
    @manager_user = User.new
  end

  # GET /manager/users/1/edit
  def edit
  end

  # POST /manager/users
  # POST /manager/users.json
  def create
    @manager_user = User.new(manager_user_params)

    respond_to do |format|
      if @manager_user.save
        format.html { redirect_to [:manager, @manager_user], notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @manager_user }
      else
        format.html { render :new }
        format.json { render json: @manager_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manager/users/1
  # PATCH/PUT /manager/users/1.json
  def update
    respond_to do |format|
      if @manager_user.update(manager_user_params)
        format.html { redirect_to [:manager, @manager_user], notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager_user }
      else
        format.html { render :edit }
        format.json { render json: @manager_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manager/users/1
  # DELETE /manager/users/1.json
  def destroy
    @manager_user.destroy
    respond_to do |format|
      format.html { redirect_to manager_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager_user
      @manager_user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_user_params
      params.require(:user).permit(:card_number, :name, :password, :sex, :id_number, :phone, :picture, :email, :address, :status, :default_group_id, :institution_id, :role_id)
    end
end
