class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
  validate :title_is_clickbait?

  def title_is_clickbait?
    title_contains = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    unless title_contains.any? { |word| title.include?(word) }
      errors.add :title, "Need a title that includes these phrases please!"
    end
  end

end


