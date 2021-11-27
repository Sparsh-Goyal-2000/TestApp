class User < ApplicationRecord

  has_many :tweets, dependent: :restrict_with_error

  has_and_belongs_to_many :followers, class_name: :User,
    join_table: :followers_followings,
    foreign_key: :following_id,
    association_foreign_key: :follower_id

  has_and_belongs_to_many :followings, class_name: :User,
    join_table: :followers_followings,
    foreign_key: :follower_id,
    association_foreign_key: :following_id

  has_many :following_tweets, through: :followings, source: :tweets
  has_many :follower_tweets, through: :followers, source: :tweets

  validates :username, :email, presence: true
end
