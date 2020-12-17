class Post < ActiveRecord::Base
    validates :title, presence: true    
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
    validate :clickbaity?
    
    def clickbaity?
        errors.add(:title, "is not clickbaity") unless title.present? && title.include?("Won't Believe" || "Secret" || "Top /\d/")
    end 
  
end 
