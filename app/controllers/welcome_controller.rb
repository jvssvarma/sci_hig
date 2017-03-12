class WelcomeController < ApplicationController
  def index
    @pending_requests = Request.where(status: 'submitted')
  end
end
