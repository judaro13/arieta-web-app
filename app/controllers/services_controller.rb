class ServicesController < ApplicationController
  before_action :require_login


  def create
    resource = Resource.where(id: params[:id]).first
    if resource
      @service = resource.services.create(name: resource.name+"#{Time.now.to_i}", resource_id: resource.id, topic: resource.name, status: "pending")
      @service.save
    end


    @services = Service.all
    respond_to do |f|
      f.js
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    @resources = Resource.all
    respond_to do |f|
      f.js
    end
  end

  private
    def service_params
      params.require(:resource).permit(:id)
    end
end
