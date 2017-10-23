class HomeController < ApplicationController
  before_action :require_login

  def index
    @resources = Resource.all
    @services = Service.all
    @resource = Resource.new()

  end

end
