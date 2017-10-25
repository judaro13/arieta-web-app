class Service < ApplicationRecord
  belongs_to :resource
  validates :name, presence: true, uniqueness: true

  def device_configuration?
    self.max_gpu || self.min_gpu || self.max_memory || self.min_memory
  end

  def deploy_data
    deploy_data = {}
    deploy_data["name"] = self.name
    deploy_data["image"] = self.resource.docker_image
    deploy_data["version"] = "latest"
    if device_configuration?
      deploy_data["device_configuration"] = {}
      deploy_data["device_configuration"]["memory"] = self.min_memory.to_i.to_s+"Mi" if self.min_memory
      deploy_data["device_configuration"]["memory_limit"] = self.max_memory.to_i.to_s+"Mi" if self.max_memory
      deploy_data["device_configuration"]["cpu"] = self.min_gpu.to_i.to_s+"m" if self.min_gpu
      deploy_data["device_configuration"]["cpu_limit"] = self.max_gpu.to_i.to_s+"m" if self.max_gpu
    end
    deploy_data["properties"] = {}
    deploy_data["properties"]["port"] = self.resource.internal_port


    deploy_data
  end
end

#
#
# "name": "treem",
# "image": "jpmml/openscoring",
# "version": "latest",
# "device_configuration": {
#   "memory":"5Mi",
#   "memory_limit":"5Mi",
#   "cpu":"100m",
#   "cpu_limit":"200m"
# }
