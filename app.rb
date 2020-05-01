require 'sinatra/base' # /base been not present before
require './lib/game'
require './lib/player'

class Battle < Sinatra::Base
  # configure(:development) { set :session_secret, 'set' }
  enable :sessions
  
  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end
  
  get '/play' do
    @game = $game
    erb :play
  end
  
  get '/attack' do
    @game = $game
    @game.switch_turn
    @game.attack(@game.current_player)
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

