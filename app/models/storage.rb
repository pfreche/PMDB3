class Storage < ActiveRecord::Base
    has_many :storageLocations, dependent: :destroy
    has_many :folders, dependent: :destroy
  
  def filePath
    getSl.filePath.uri+"/"+path
  end

  def webPath
    getSl.webPath.name
  end

  def tnFilePath
    getSl.tnFilePath.name
  end

  def tnWebPath
    getSl.tnWebPath.name
  end

  private

  def getSl
    @sl ||= StorageLocation.where("storage_id = ? AND inUse = ?", id, true).first
  end

end
