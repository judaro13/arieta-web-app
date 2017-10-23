class Service < ApplicationRecord
  belongs_to :resource
  validates :name, presence: true, uniqueness: true
end
