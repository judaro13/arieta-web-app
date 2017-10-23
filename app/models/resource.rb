class Resource < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :docker_image, presence: true

  has_many :services, dependent: :destroy

end
