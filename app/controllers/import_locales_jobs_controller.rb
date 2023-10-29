class ImportLocalesJobsController < ApplicationController
  def index
    @import_locales_jobs = ImportLocalesJob.all

    render json: @import_locales_jobs, status: :ok
  end

  def show
    @import_locales_job = ImportLocalesJob.find(params[:id])

    render json: @import_locales_job, status: :ok
  end

  def create
    @import_locales_job = ImportLocalesJob.create!

    respond_to do |format|
      format.html { redirect_to states_path, notice: 'Locales are being created!' }
      format.json { render json: @import_locales_job, status: :created }
    end
  end
end
