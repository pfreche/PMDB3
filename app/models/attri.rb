class Attri < ActiveRecord::Base
  has_and_belongs_to_many :mediaObjects
  belongs_to :agroup
end
