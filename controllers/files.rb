require 'sinatra'

class UploadPdfApp < Sinatra::Base
  get '/upload' do
    slim :upload
  end
end
