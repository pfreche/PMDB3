class Location < ActiveRecord::Base
  belongs_to :mediaObject, dependent: :destroy
end
