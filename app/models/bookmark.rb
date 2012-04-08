class Bookmark < MediaObject
  has_one :location, foreign_key: :mediaObject_id
end