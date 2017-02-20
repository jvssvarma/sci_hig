class RequestsController < ApplicationController
  before_action :find_request, only: [:show]

  def index
    @requests = Request.all
  end

  def new
    @request = current_user.requests.build
  end

  def create
    @request = current_user.requests.build(request_params)

    if @request.save
      redirect_to @request, notice: "Your request is added successfully"
    else
      render 'new', notice: "Something went wrong. Please try again"
    end
  end

  def show
  end

  private

  def request_params
    params.require(:request).permit(:date, :reason)
  end

  def find_request
    @request = Request.find(params[:id])
  end
end
