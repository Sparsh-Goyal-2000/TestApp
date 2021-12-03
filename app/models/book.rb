class Book < ApplicationRecord

  has_many :media_tags, as: :taggable, dependent: :destroy
  has_many :tags, through: :media_tags

end
