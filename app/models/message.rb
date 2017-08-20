class Message < ActiveRecord::Base
  belongs_to :purchaser, class_name: 'User'
  belongs_to :seller, class_name: 'User'
  belongs_to :article
end
