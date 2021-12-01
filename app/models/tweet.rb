class Tweet < ApplicationRecord

  belongs_to :user, counter_cache: true

  validates :content, presence: true

end
