class User < ApplicationRecord

  has_many :tweets, dependent: :restrict_with_error

  has_many :following_relations, class_name: :Relation, foreign_key: :following_id
  has_many :follower_relations, class_name: :Relation, foreign_key: :follower_id

  has_many :followers, through: :following_relations
  has_many :followings, through: :follower_relations

  has_many :following_tweets, through: :followings, source: :tweets
  has_many :follower_tweets, through: :followers, source: :tweets

  validates :username, :email, presence: true

end
