class Customer::WorkingRecordsController < ApplicationController
  before_action :set_working_record, only: [:show, :edit, :update, :destroy]

  # GET /working_records
  # GET /working_records.json
  def index
    @working_records = WorkingRecord.all
  end

  # GET /working_records/1
  # GET /working_records/1.json
  def show
  end

  # GET /working_records/new
  def new
    @working_record = WorkingRecord.new
  end

  # GET /working_records/1/edit
  def edit
  end

  # POST /working_records
  # POST /working_records.json
  def create
    @working_record = WorkingRecord.new(working_record_params)

    respond_to do |format|
      if @working_record.save
        format.html { redirect_to @working_record, notice: 'Working record was successfully created.' }
        format.json { render :show, status: :created, location: @working_record }
      else
        format.html { render :new }
        format.json { render json: @working_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /working_records/1
  # PATCH/PUT /working_records/1.json
  def update
    respond_to do |format|
      if @working_record.update(working_record_params)
        format.html { redirect_to @working_record, notice: 'Working record was successfully updated.' }
        format.json { render :show, status: :ok, location: @working_record }
      else
        format.html { render :edit }
        format.json { render json: @working_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /working_records/1
  # DELETE /working_records/1.json
  def destroy
    @working_record.destroy
    respond_to do |format|
      format.html { redirect_to working_records_url, notice: 'Working record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_working_record
      @working_record = WorkingRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def working_record_params
      params[:working_record]
    end
end
