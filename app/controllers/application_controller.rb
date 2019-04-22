class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :null_session
  before_action :authenticate_user!, except: [:show, :index]

end
