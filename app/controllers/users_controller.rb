class UsersController < ApplicationController
  include GinaAuthentication::Users

  authorize_resource
end
