class RequestsController < ApplicationController
  before_action :find_request, only: [:show, :edit, :update, :destroy]

  def index
    @requests = current_user.requests
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

  def edit
    authorize @request
  end

  def update
    authorize @request

    if @request.update request_params
      redirect_to @request, notice: "Your request is update successfully"
    else
      render 'update', notice: "Something went wrong. Please try again"
    end
  end

  def destroy
    @request.destroy
    redirect_to requests_path, notice: "Request deleted successfully"
  end

  private

  def request_params
    params.require(:request).permit(:date, :reason, :status)
  end

  def find_request
    @request = Request.find(params[:id])
  end
end
