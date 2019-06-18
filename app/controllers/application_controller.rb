class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def hello
    render html: 'Welcome to your BJJ training logger. Created by Israel Rivas González'
  end
end
