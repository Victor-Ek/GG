class Main < Sinatra::Base
  get '/' do
    redirect '/home'
  end

  get '/home' do

    slim :home
  end

  get '/login' do

    slim :login
  end

  post '/login' do
    redirect Account.authenticate(params[:username],params[:password])
  end

  get '/createAccount' do

    slim :createAccount
  end

  get '/createAccount/usrTaken' do

    slim :createAccountUsrTaken
  end

  post '/createAccount' do
    p params['username']
    redirect Account.create(params['username'],params[:email],params[:password])
  end

end