class LoginController < ApplicationController
=begin
  skip_before_action :authenticate_request, only: %i[new signup login register]
=end

  def new
  end

end
