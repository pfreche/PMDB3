class Bookmark < MediaObject
  has_one :location, foreign_key: :mediaObject_id
   has_and_belongs_to_many   :attris
end