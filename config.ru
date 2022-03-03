require 'sinatra'

class App < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/potato' do
    { roll: rand(1..3) }.to_json
  end

  get '/' do
    "<h2>Hello <em>World</em>!</h2>"
  end

  # dynamic routes with named parameters (returns params hash like {"num1"=>"3", "num2"=>"5"})
  get '/add/:num1/:num2' do
    num1 = params[:num1].to_i
    num2 = params[:num2].to_i

    sum = num1 + num2
    { result: sum }.to_json
  end
  
  # for working with active record data
  get '/games/:id' do
    game = Game.find(params[:id])
    game.to_json
  end
  
end

run App
