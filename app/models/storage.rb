class Storage < ActiveRecord::Base
  
  def filePath
    getSl.filePath.name
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