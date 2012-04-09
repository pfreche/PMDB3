class MediaObject < ActiveRecord::Base
  
  has_and_belongs_to_many   :atrris
  
  def filePath
    folder = Folder.find(this.folder_id)
    
  end
  
end
