require 'faker'

20.times do |num|
  Category.create(title: "#{num}")
end 