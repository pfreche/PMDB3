module MediaObjectsHelper
  
  def edit(media_object)
    if media_object.typ_id == 1 
      edit_location_path(media_object.location)
      
    else 
      "afdad"
    end
  end
end
