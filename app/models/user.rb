class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_many :comments
    has_many :ratings, through: :comments

    def average_user_rating
        (self.ratings.pluck(:value).sum.to_f / self.ratings.count).round(2)
    end
end
