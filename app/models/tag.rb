class Tag < ApplicationRecord

  has_many :media_tags, dependent: :destroy
  has_many :movies, through: :media_tags, source: :taggable, source_type: :Movie
  has_many :books, through: :media_tags, source: :taggable, source_type: :Book

end
