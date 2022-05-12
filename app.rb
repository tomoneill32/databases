require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
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

  run! if app_file == $0
end
