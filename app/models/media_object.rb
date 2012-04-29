class MediaObject < ActiveRecord::Base
  
  has_and_belongs_to_many   :attris
  has_one :location, :foreign_key => "mediaObject_id"
  
  def filePath
    folder = Folder.find(this.folder_id)
    
  end
  
end
