class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  def actual_recipe
    Recipe.find(params[:id])
  end

  get '/recipes' do
    @recipes  = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = actual_recipe
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = actual_recipe
    erb :edit
  end

  post '/recipes' do
    @recipe  = Recipe.create(params)
    redirect "/recipes/#{@recipe .id}"
  end

  patch '/recipes/:id' do
    @recipe = actual_recipe
    @recipe.update(params)
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    @recipe = actual_recipe
    @recipe.delete
    redirect "/recipes"
  end



end
