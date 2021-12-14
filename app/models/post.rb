class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    validate :title

    def must_be_clickbait
        unless title.include?(%w("Won't Believe" "Secret" "Top" "Guess"))
            errors.add(:title, "not clickbaity")
        end
    
    end

end
