class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_many :comments
    has_many :ratings, through: :comments

    def average_user_rating
        (self.ratings.pluck(:value).sum.to_f / self.ratings.count).round(2)
    end

    def ratings_sum
        self.ratings.pluck(:value).sum.to_f
    end

    def ratings_count
        self.ratings.count
    end

    def rating_name
        case average_user_rating
        when 0..1
            "Not Trusted Instructer"
        when 1..2
            "Avid Learner"
        when 2..3
            "Novice Instructor"
        when 3..4
            "Semi Pro Instructor"
        when 4..5
            "Elite Instructor"
    end
end
end
