class ImportCitiesJobsController < ApplicationController
  def index
    @import_locales_jobs = ImportLocalesJob.all
  end

  def show
    @import_locales_job = ImportLocalesJob.find(params[:id])
  end

  def create
    @import_locales_job = ImportLocalesJob.create!

    respond_to do |format|
      format.html { redirect_to states_path, notice: 'Your cities are being created!' }
      format.json { render :show, status: :created, location: @city }
    end
  end
end
