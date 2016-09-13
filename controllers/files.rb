require 'sinatra'

class UploadPdfApp < Sinatra::Base
  get '/upload' do
    slim :upload_form
  end

  post '/upload/test/' do
    begin
      new_file = CreateNewFile.call(
        slide_name: params['fileToUpload'][:filename],
        document: params['fileToUpload'][:tempfile].read)

      rescue => e
      logger.error "NEW FILE FAIL: #{e}"
    end
  end
end
