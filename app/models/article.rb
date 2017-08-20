class Article < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :category
  belongs_to :user
  has_many :messages

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
