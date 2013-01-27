module MediaObjectsHelper
  def edit(media_object)
    if media_object.typ_id == 1
      edit_location_path(media_object.location)

    else
      if media_object.typ_id == 2
        pic_media_object_path(media_object)

      else
      if media_object.typ_id == 1024
        "adfa"
      end

      end
    end
  end
end
