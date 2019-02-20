class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

get('/recipes') { 
  @recipes = Recipe.all
  erb :index
 }

get('/recipes/new') { erb :new }

post('/recipes') {
  @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
  redirect to "recipes/#{@recipe.id}"
}

get('/recipes/:id') {
  @recipe = Recipe.find(params[:id])
  erb :show
}

delete('/recipes/:id') {
  @recipe = Recipe.find(params[:id])
  Recipe.delete(params[:id])
  redirect to '/recipes'
}

get('/recipes/:id/edit') {
  @recipe = Recipe.find(params[:id])
  erb :edit
}

patch('/recipes/:id') {
  @recipe = Recipe.find(params[:id])
  @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
  redirect to "/recipes/#{@recipe.id}"
}


end
