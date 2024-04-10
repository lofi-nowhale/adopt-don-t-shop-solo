class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def new
    
  end

  def create
    new_application = Application.new(application_params)

    if new_application.save
      redirect_to "/applications/#{new_application.id}"
    else
      flash[:alert] = "Application not created: Required information missing."
      render :new
    end
    
  end

  private
  def application_params
    params.permit(:id, :name, :street_address, :city, :state, :zipcode, :description, status: :InProgress)
  end
end