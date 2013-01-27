class Folder < ActiveRecord::Base
  belongs_to :mediaObject, dependent: :destroy
  
  def filePath

    storage = Storage.find(storage_id)
    a =     storage.filePath + "/" +  mpath + "/" +  lfolder 
    a.gsub("//", "/").gsub("//", "/")
  end

end
