class Folder < ActiveRecord::Base
  # belongs_to :mediaObject, dependent: :destroy  # tested and okay
  has_many :mediaObjects , dependent: :destroy  # tested and okay
  
  def filePath

    storage = Storage.find(storage_id)
    a =     storage.filePath + "/" +  mpath + "/" +  lfolder 
    a.gsub("//", "/").gsub("//", "/")
  end
  
  def mediaObject # not tested yet
    MediaObject.find(mediaObject.id)
  end

end
