# index
get '/categories' do 
  @categories = Category.all
  erb :'categories/index'
end 


# if anything in the categories controller becomes primarily about articles, that should be moved to the articles controller