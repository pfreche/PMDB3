require 'find'

class Help
  def new_tag(mo, title, description)
    if title || description
      tag = Tag.new(title: title, description: description)
    mo.tag = tag
    end
  end

  def get_tag(mo)
    tag = mo.tag
    #       unless tag
    #     tag = Tag.new
    #     mo.tag = tag
    #   end
    tag
  end

  def new_media_object (cobject, na)
    @media_object = Bookmark.new
    @media_object.name = na

    @media_object.typ_id = 1
    cobject.mediaObject =  @media_object
    @media_object
  end

  def get_media_object(cobject, na)

    @media_object = cobject.mediaObject
    unless @media_object
      @media_object = Bookmark.new
    @media_object.name = na
    @media_object.typ_id = 1
    @media_object.save
    cobject.mediaObject =  @media_object
    cobject.save
    end
    @media_object
  end

  def getDirectory(d)
    a = []
    Find.find(d) {|path|
      if File.directory?(path)
      a << path
      end
    }
    a
  end

  def getFiles(d)
    a = []
    Find.find(d) {|path|
      unless File.directory?(path)
      a << path
      end
    }
    a
  end
end