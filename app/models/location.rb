class Location < ActiveRecord::Base
  belongs_to :mediaObject, dependent: :destroy
  has_many :storageLocations
end
