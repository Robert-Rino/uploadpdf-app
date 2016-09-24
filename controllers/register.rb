require 'sinatra'

class UploadPdfApp < Sinatra::Base
  get '/register' do
    slim :register
  end

  post '/register/?' do
    registration = Registration.call(params)
    if registration.failure?
      flash[:error] = 'Please enter a valid username and email'
      redirect 'register'
      halt
    end

    begin
      EmailRegistrationVerification.call(registration)
      redirect '/'
    rescue => e
      logger.error "FAIL EMAIL: #{e}"
      flash[:error] = 'Unable to send email verification -- please '\
                      'check you have entered the right address'
      redirect '/register'
    end
  end
end
