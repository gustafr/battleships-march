require 'sinatra/base'



class BattleshipsWeb < Sinatra::Base
  set :views, proc {File.join(root, '..', 'views')}
  enable :sessions

  get '/' do
    #@visitor = params[:name]
    erb :index
  end

  get '/new_game' do
  #@visitor = params[:name]
  #byebug
  erb :new_game
  end

  post '/new_game' do
    #@visitor = params[:name]
    session[:name] = params[:name]
     if session[:name] == ""
      erb :new_game
    else
      erb :board
    end
  end

  def name_required
    puts "You need to type in a name."

  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
