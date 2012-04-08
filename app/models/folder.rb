class Folder < ActiveRecord::Base
  def filePath

    storage = Storage.find(storage_id)
    storage.filePath + "/" +  mpath + "/" +  lfolder 
  end

end
