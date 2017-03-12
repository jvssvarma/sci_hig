class RequestsController < ApplicationController
  before_action :find_request, only: [:show, :edit, :update, :destroy, :approve]

  def index
    @requests = Request.requests_added_by(current_user).page(params[:page]).per(10)
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
    authorize @request
    @request.destroy
    redirect_to requests_path, notice: "Request deleted successfully"
  end

  def approve
    authorize @request
    @request.approved!
    redirect_to root_path, notice: "Request is approved."
  end

  private

  def request_params
    params.require(:request).permit(:date, :reason, :status, :request_hours)
  end

  def find_request
    @request = Request.find(params[:id])
  end
end
