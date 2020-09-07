class ApplicationController < ActionController::API
  include Response
  include UserAuthHandler

end
