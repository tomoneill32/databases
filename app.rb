require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :home
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/add_bookmark' do
    Bookmark.create(params[:url], params[:title])
    redirect '/bookmarks'
  end

  post '/delete_bookmark' do
    Bookmark.delete(params[:bookmark_to_delete])
    redirect '/bookmarks'
  end

  post '/update_bookmark' do
    session[:bookmark_to_update] = params[:bookmark_to_update] 
    erb :'bookmarks/updated_bookmark'  
  end

  post '/updating' do 
    Bookmark.update(session[:bookmark_to_update],params[:url], params[:title])
    redirect '/bookmarks'
  end 

  run! if app_file == $0
end
