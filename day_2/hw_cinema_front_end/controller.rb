require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('./models/film')
also_reload('./models/*')

get '/index' do
  @film_list = Film.all()
  erb(:index)
end

get '/index/:id' do
  @film_title = Film.film_title_by_id(params[:id])
  @film_price = Film.film_price_by_id(params[:id])
  erb(:film_info)
end
