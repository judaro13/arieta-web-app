class ServicesController < ApplicationController
  before_action :require_login


  def create
    resource = Resource.where(id: params[:id]).first
    @service = Service.new
    if resource
      @service = resource.services.create(name: resource.name+" #{rand(0...999)}", resource_id: resource.id, topic: resource.name, status: "pending")
      @service.save
    end

    @services = Service.all
    respond_to do |f|
      f.js
    end
  end

  def show
    @service = Service.find(params[:id])
    @services = Service.all
    respond_to do |f|
      f.js
    end
  end

  def update
    if @service = Service.find(params[:id])
      @service.update(service_params)
    end
    respond_to do |f|
      f.js
    end

  end

  def destroy
    if @service = Service.find(params[:id])
      @service.destroy
    end
    @services = Service.all
    respond_to do |f|
      f.js
    end
  end

  private
    def service_params
      params.require(:service).permit(:id,:max_gpu,:min_gpu,:max_memory,:min_memory,:position_x,:position_y,:pmml_data_path,:input_data,:input_data_path,:outpu_data_path,:in_connection,:out_connection,:service_ip,:service_port,:service_full_path,:status,:connection_settings )
    end
end
