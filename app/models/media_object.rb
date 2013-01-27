class MediaObject < ActiveRecord::Base
  
  has_and_belongs_to_many   :attris
  #has_one :folder,   :foreign_key => "mediaObject_id", dependent: :destroy
  belongs_to :folder
  has_one :location, :foreign_key => "mediaObject_id", dependent: :destroy
  has_one :tag,      :foreign_key => "mediaObject_id", dependent: :destroy
  
  def filePath
    folder = Folder.find(folder_id)
    
  end
  
  def url
    folder = Folder.find(folder_id)
    a= folder.filePath + name
    a.gsub("\/", "\\")
  end
  
end
