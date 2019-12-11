require 'sinatra'
require 'sinatra/contrib/all' if development?

get '/' do
  "Hello World!!!!"
end

get '/dice' do
  "Rolling the die...  #{rand(1..6)}"
end

get '/name/:first/:last' do
  return "Your name is #{params[:first]} #{params[:last]}"
end

get '/friends/:number' do
  friends = ["Joey", "Phoebe", "Monica", "Rachel", "Chandler", "Ross"]
  index = params["number"].to_i
  return friends[index]
end

get '/square/:number' do
  result  = params[:number].to_i * paramsgit remote add origin git@github.com:MrJamieRyan/Codeclan_Work.git
git push -u origin master[:number].to_i
  return result.to_s
end
