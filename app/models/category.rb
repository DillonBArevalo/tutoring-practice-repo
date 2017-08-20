class Category < ActiveRecord::Base
  has_many :articles

  # def articles
  #   Article.where(category_id: self.id)
  # end
  # finding articles where category id is this category

  validates :title, presence: true  
end
