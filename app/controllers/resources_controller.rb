class ResourcesController < ApplicationController
  before_action :require_login


  def create
    @resource = Resource.new(resource_params)
    @resource.save
    @resources = Resource.all
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
    def resource_params
      params.require(:resource).permit(:name, :docker_image, :resource_type)
    end
end
