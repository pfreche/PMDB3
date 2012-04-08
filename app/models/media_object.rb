class MediaObject < ActiveRecord::Base
  def filePath
    folder = Folder.find(this.folder_id)
    
  end
end
