# index 
# we can't find articles without knowing what category we're in
# articles belongs to a category, to be able to grab an article, we need to know what category we're grabbing from. So we have to pass the information.
get '/categories/:category_id/articles' do 
  @category = Category.find(params[:category_id])
  # now that we have our category, we can use our association to find all our associated articles
  @articles = @category.articles
  # gives us all articles that are related to the category
  erb :'articles/index'
end 

# new
get '/categories/:category_id/articles/new' do 
  if logged_in?
    # if you're logged in then we'll show the form for creating a new article
    @category = Category.find(params[:category_id])
    @article = Article.new
    erb :'articles/new'
  else
    # otherwise, go log in
    redirect '/login'
  end 
end 

# create
# same as get index
post '/categories/:category_id/articles' do 
  @article = Article.new(params[:article])
  if @article.save
    redirect "/categories/#{@article.category_id}/articles/#{@article.id}"
    # take them to what they just created
  else 
    @errors = @article.errors.full_messages
    erb :'articles/new'
  end 
end

# show 
get '/categories/:category_id/articles/:id' do
  @category = Category.find(params[:category_id])
  @article = Article.find(params[:id]) 
  erb :'articles/show'
end 

# edit
get '/categories/:category_id/articles/:id/edit' do
  @article = Article.find(params[:id])
  @category = Category.find(params[:category_id])
  erb :'articles/edit'
end

# edit post
put '/categories/:category_id/articles/:id' do
  @article = Article.find(params[:id])
  @category = Category.find(params[:category_id])
  
  if @article.update_attributes(params[:article])
    redirect "/categories/#{@category.id}/articles/#{@article.id}"
  else
    redirect "/categories/#{@category.id}/articles/#{@article.id}/edit"
  end 
end 

# delete
delete '/categories/:category_id/articles/:id' do 
  @category = Category.find(params[:category_id])
  # we need category because of nested routing needing that information
  @article = Article.find(params[:id])
  @article.destroy
  redirect "/categories/#{@category.id}/articles"
  # interpolated, made the category variable accessible with @, it was the wild card, so we had to signify the id.
end 









# This is a full crud route : ) 




