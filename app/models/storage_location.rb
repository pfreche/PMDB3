class StorageLocation < ActiveRecord::Base
  validates :storage_id, presence: true
  validates :filePath_id, presence: true
  validates :webPath_id, presence: true
  validates :tnFilePath_id, presence: true
  validates :tnWebPath_id, presence: true
  
  belongs_to :storage
  belongs_to :filePath, class_name: "Location"
  belongs_to :webPath,  class_name: "Location"
  belongs_to :tnFilePath, class_name: "Location"
  belongs_to :tnWebPath, class_name: "Location"

end
