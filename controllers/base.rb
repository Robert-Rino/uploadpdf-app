require 'sinatra'

# Base class for ShareFilesApp Web Application
class UploadPdfApp < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)
  set :public_dir, File.expand_path('../../public', __FILE__)

  get '/' do
    slim :home
  end
end
