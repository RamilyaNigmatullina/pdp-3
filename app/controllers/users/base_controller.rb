module Users
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_resource!
  end
end
